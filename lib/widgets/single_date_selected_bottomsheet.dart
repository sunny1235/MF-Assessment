import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:mf_assessment/providers/calendar_provider.dart';
import 'package:mf_assessment/statics/dummy_data.dart';
import 'package:url_launcher/url_launcher.dart';




class SingleDateBottomsheetUI extends ConsumerWidget {
  const SingleDateBottomsheetUI({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final calendarProvider  =ref.watch(calndarProvider);
    return ScrollConfiguration(
      behavior: const MaterialScrollBehavior().copyWith(overscroll: false),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
              children: List.generate(
            singleDateData.length,
            (index) => Container(
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade300,
                          spreadRadius: 0.7,
                          blurRadius: 15)
                    ]),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              singleDateData[index].name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(
                              "ID: ${singleDateData[index].id}",
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 105, 100, 100)),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                const Text("Offerred:"),
                                Text(
                                  singleDateData[index].offered,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text("Current:"),
                                Text(
                                  singleDateData[index].offered,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: singleDateData[index].priority ==
                                              "Medium Priority"
                                          ? Colors.amber
                                          : Colors.red,
                                      borderRadius: BorderRadius.circular(100)),
                                  height: 8,
                                  width: 8,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  singleDateData[index].priority,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: singleDateData[index].priority ==
                                              "Medium Priority"
                                          ? Colors.amber
                                          : Colors.red),
                                ),
                              ],
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            _makePhoneCall("+917021237098");
                          },
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(100)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade400,
                                      spreadRadius: 0.7,
                                      blurRadius: 15)
                                ]),
                            child: const Icon(
                              Icons.call,
                              color: Colors.blue,
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      color: Colors.grey,
                      height: 2,
                      width: double.infinity,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Due Date",
                            ),
                            Text(
                              DateFormat.yMMMMd().format(calendarProvider.initialDate.last!),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Level"),
                            Text(
                              "${singleDateData[index].level}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Days Left"),
                            Text(
                              "${calendarProvider.initialDate.first!.difference(DateTime.now()).inDays}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                )),
          )),
        ),
      ),
    );
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }
}