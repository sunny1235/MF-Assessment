import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:mf_assessment/providers/calendar_provider.dart';
import 'package:mf_assessment/statics/dummy_data.dart';
import 'package:mf_assessment/widgets/multiple_date_bottomsheet.dart';
import 'package:mf_assessment/widgets/single_date_selected_bottomsheet.dart';

class CalendarWidget extends ConsumerWidget {
  const CalendarWidget({super.key, required this.dateType});
  final int dateType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(calndarProvider);

    return CalendarDatePicker2(
      config: dateType == 0
          ? CalendarDatePicker2Config(
              calendarType: CalendarDatePicker2Type.single,
            )
          : CalendarDatePicker2WithActionButtonsConfig(
              calendarType: CalendarDatePicker2Type.range,
              okButton: const Text("OK")),
      value: provider.initialDate,
      onValueChanged: (dates) {
        provider.setInitialDate(dates);
        if (dateType == 0) {
          showPopupForSingleDate(context);
        } else {
          if (dates.last!.difference(dates.first!).inDays <= 7) {
            provider.setDateRangeValue();
            provider.setDatePicked();
            if (dates.length == 2) {
              showPopupForMultiDate(context);
            }
          } else {
            provider.resetInitialDate();
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
                "Please Select 7 or less Days",
              ),
              backgroundColor: Colors.red,
            ));
          }
        }
      },
    );
  }

  Future<dynamic> showPopupForSingleDate(BuildContext context) {
    return showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        context: context,
        builder: (context) {
          return DefaultTabController(
              length: 4,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const TabBar(
                    labelColor: Colors.black,
                    padding: EdgeInsets.only(
                      top: 30,
                    ),
                    indicatorColor: Colors.black,
                    labelPadding: EdgeInsets.only(bottom: 15),
                    tabs: <Widget>[
                      TabTitleWidget(
                        title: "ALL(6)",
                      ),
                      TabTitleWidget(
                        title: "HRD(3)",
                      ),
                      TabTitleWidget(
                        title: "Tech 1(2)",
                      ),
                      TabTitleWidget(
                        title: "Follow Up(1)",
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: <Widget>[
                        for (int i = 0; i < 4; i++)
                          const SingleDateBottomsheetUI(),
                      ],
                    ),
                  )
                ],
              ));
        });
  }

  Future<dynamic> showPopupForMultiDate(BuildContext context) {
    return showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        context: context,
        builder: (context) {
          return const MultipleDateBottomSheetWidget();
        });
  }
}

class TabTitleWidget extends StatelessWidget {
  const TabTitleWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
          color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600),
    );
  }
}
