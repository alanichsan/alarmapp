import 'package:bibit_alarm/apps/widgets/custom_list_item.dart';
import 'package:bibit_alarm/shared/theme.dart';
import 'package:flutter/material.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({Key? key}) : super(key: key);

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // NOTE : SET BACKGROUND
        backgroundColor: kBackgroundColor,
        body: ListView(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 30,
              ),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 23, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: kGreenSameColor),

                    // NOTE : BUTTON CREATE/SET NEW ALARM
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_alarm,
                          size: 14,
                          color: kGreenColor,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Create',
                          style: greenTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: regular,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 12,
                  ),

                  // NOTE : GET and SET DATA FROM WIDGETS 'lib/apps/widgets/custom_list_item.dart'
                  const CustomListItem(
                    checked: false,
                    time: '11.00',
                    status: 0,
                    descriptions: 'Meeting with Client 1',
                  ),

                  const SizedBox(
                    height: 12,
                  ),

                  // NOTE : GET and SET DATA FROM WIDGETS 'lib/apps/widgets/custom_list_item.dart'
                  const CustomListItem(
                      checked: true,
                      time: '21.00',
                      status: 1,
                      descriptions: 'Start Work'),

                  const SizedBox(
                    height: 12,
                  ),

                  // NOTE : GET and SET DATA FROM WIDGETS 'lib/apps/widgets/custom_list_item.dart'
                  const CustomListItem(
                      checked: true,
                      time: '14.00',
                      status: 2,
                      descriptions: 'Sleeping'),
                ],
              ),
            ),
          ],
        ));
  }
}
