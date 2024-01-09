import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:mf_assessment/models/multi_model.dart';
import 'package:mf_assessment/providers/calendar_provider.dart';
import 'package:mf_assessment/statics/dummy_data.dart';

// class MultipleDateBottomSheetWidget extends StatefulWidget {
//   const MultipleDateBottomSheetWidget(
//       {super.key,});
  

//   @override
//   State<MultipleDateBottomSheetWidget> createState() =>
//       _MultipleDateBottomSheetWidgetState();
// }

// class _MultipleDateBottomSheetWidgetState
//     extends State<MultipleDateBottomSheetWidget> {
  

 

//   @override
//   void initState() {
//     calculateTotal();

//     super.initState();
//   }

 

  

 
// }

class MultipleDateBottomSheetWidget extends ConsumerStatefulWidget {
  const MultipleDateBottomSheetWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MultipleDateBottomSheetWidgetState();
}

class _MultipleDateBottomSheetWidgetState extends ConsumerState<MultipleDateBottomSheetWidget> {


  @override
  void initState() {
    ref.read(calndarProvider).calculateTotal();
    super.initState();
  }


  // int tabBarSelectedIndex = 0;
  // int hrdTotalValue = 0;
  // int techTotalValue = 0;
  // int followUpTotalValue = 0;
  // int allTotalValue = 0;

  

  @override
  Widget build(BuildContext context) {
    final calendarProvider = ref.watch(calndarProvider);
    return DefaultTabController(
        length: 4,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TabBar(
              labelColor: Colors.black,
              padding: const EdgeInsets.only(
                top: 30,
              ),
              indicatorColor: Colors.black,
              labelPadding: const EdgeInsets.only(bottom: 15),
              onTap: (value) {
                calendarProvider.setTabBarIndex(value);
              },
              tabs: <Widget>[
                Text(
                  "ALL(${calendarProvider.allTotalValue})",
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "HRD(${calendarProvider.hrdTotalValue})",
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "Tech 1(${calendarProvider.techTotalValue})",
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "Follow Up(${calendarProvider.followUpTotalValue})",
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  for(int i = 0 ; i < 4 ; i ++)
                  multipleDateSelectedUI(
                    context,
                    calendarProvider.dateRangeValue,
                    calendarProvider.datePicked.day,
                    DateFormat('MMM').format(DateTime(0, calendarProvider.datePicked.month)),
                    calendarProvider
                  ),
                  
                ],
              ),
            )
          ],
        ));
  }

  Widget multipleDateSelectedUI(
    BuildContext context,
    int dateRangeValue,
    int formattedDate,
    String formattedMonth,
    CalendarProvider provider,
  ) {
    return ScrollConfiguration(
      behavior: const MaterialScrollBehavior().copyWith(overscroll: false),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Column(
              children: List.generate(
            dateRangeValue + 1 ,
            (index) => Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.only(
                  left: 0, right: 10, top: 10, bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade300,
                      spreadRadius: 0.7,
                      blurRadius: 15)
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: 3,
                    color: Colors.red,
                  ),
                  Column(
                    children: [
                      Text((formattedDate + index).toString(),
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600)),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        (formattedMonth).toString(),
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: provider.tabBarSelectedIndex == 1
                                ? Theme.of(context).primaryColor
                                : Colors.white,
                            border: Border.all(
                                width: 2, color: Colors.grey.withOpacity(0.3)),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(100))),
                        child: Center(child: Text("${multiDateData[index].hrd}", style: TextStyle(color: provider.tabBarSelectedIndex == 1 ? Colors.white : Colors.black),)),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text("HRD"),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: provider.tabBarSelectedIndex == 2
                                ? Theme.of(context).primaryColor
                                : Colors.white,
                            border: Border.all(
                                width: 2, color: Colors.grey.withOpacity(0.3)),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(100))),
                        child: Center(child: Text("${multiDateData[index].tech}",style: TextStyle(color: provider.tabBarSelectedIndex == 2 ? Colors.white : Colors.black))),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text("Tech 1"),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: provider.tabBarSelectedIndex == 3
                                ? Theme.of(context).primaryColor
                                : Colors.white,
                            border: Border.all(
                                width: 2, color: Colors.grey.withOpacity(0.3)),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(100))),
                        child: Center(child: Text("${multiDateData[index].followup}",style: TextStyle(color: provider.tabBarSelectedIndex == 3 ? Colors.white : Colors.black))),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text("Follow Up"),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 56, 56, 56),
                            borderRadius:
                                BorderRadius.all(Radius.circular(100))),
                        child: Center(
                            child: Text(
                          "${multiDateData[index].total}",
                          style: const TextStyle(color: Colors.white),
                        )),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text("Total"),
                    ],
                  ),
                ],
              ),
            ),
          )),
        ),
      ),
    );
  }
}




