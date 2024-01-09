import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mf_assessment/providers/calendar_provider.dart';
import 'package:mf_assessment/providers/homescreen_provider.dart';
import 'package:mf_assessment/widgets/calendar_widget.dart';
import 'package:mf_assessment/widgets/multiple_date_bottomsheet.dart';
import 'package:mf_assessment/widgets/single_date_selected_bottomsheet.dart';
import 'package:toggle_switch/toggle_switch.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(homeProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Text(
          "My Calendar",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.all(10),
            child: ToggleSwitch(
              initialLabelIndex: provider.dateType,
              totalSwitches: 2,
              borderColor: [Theme.of(context).primaryColor],
              borderWidth: 1,
              inactiveBgColor: Colors.white,
              inactiveFgColor: Theme.of(context).primaryColor,
              labels: const [
                'Day',
                'Week',
              ],
              onToggle: (index) {
                provider.setDateType(index ?? 0);
                ref.read(calndarProvider).resetInitialDate();
              },
            ),
          ),
        ],
      ),
      body: CalendarWidget(dateType :provider.dateType),
    );
  }
}
