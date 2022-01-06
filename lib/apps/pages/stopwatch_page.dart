import 'dart:async';

import 'package:bibit_alarm/apps/widgets/custom_button_item.dart';
import 'package:bibit_alarm/shared/theme.dart';
import 'package:flutter/material.dart';

class StopwatchPage extends StatefulWidget {
  const StopwatchPage({Key? key}) : super(key: key);

  @override
  State<StopwatchPage> createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  // NOTE : DURATION FIELD
  Duration duration = const Duration();

  // NOTE : TIME FIELD
  Timer? timer;

  // NOTE : SET COUNTDOWN (If you want to activet just choose true)
  bool isCountdown = false;

  // NOTE : DURATION OF COUNTDOWN IF TRUE
  static const countdownDuration = Duration(minutes: 10);

  @override
  // NOTE : SET TIME
  void initState() {
    super.initState();
    reset();
  }

  // NOTE : SET TIME BACK TO 0
  void reset() {
    if (isCountdown) {
      setState(() => duration = countdownDuration);
    } else {
      setState(() => duration = const Duration());
    }
  }

  // NOTE : SO THAT TIME CAN BE DYNAMIC
  void addTime() {
    final addSeconds = isCountdown ? -1 : 1;
    setState(() {
      final seconds = duration.inSeconds + addSeconds;

      if (seconds < 0) {
        timer?.cancel();
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }

  // NOTE : START TIME (start from 0)
  void startTime({bool resets = true}) {
    if (resets) {
      reset();
    }
    timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime());
  }

  // NOTE : STOP THE DYNAMIC TIME
  void stopTimer({bool resets = true}) {
    if (resets) {
      reset();
    }
    setState(() => timer!.cancel());
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: kBackgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildTime(),
            const SizedBox(
              height: 50,
            ),
            buttonTime(),
          ],
        ),
      );

// NOTE : LOCAL WIDGET TO BUILD and SHOW TIME TO HOURS, MINUTES, and SECONDS
  Widget buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');

    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //NOTE : SET and GET DATA FROM  WIDGET TIME CARD
        timeCard(header: 'HOURS', time: hours),

        const SizedBox(
          width: 8,
        ),

        //NOTE : SET and GET DATA FROM  WIDGET TIME CARD
        timeCard(header: 'MINUTES', time: minutes),

        const SizedBox(
          width: 8,
        ),

        //NOTE : SET and GET DATA FROM  WIDGET TIME CARD
        timeCard(header: 'SECONDS', time: seconds),
      ],
    );
  }
  

// NOTE : LOCAL WIDGET TO BUILD and SHOW TIME TO HOURS, MINUTES, and SECONDS
  Widget timeCard({
    required String time,
    required String header,
  }) =>
  // NOTE : FIELD FORM TIME
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            header,
            style: primaryTextStyle,
          ),

          const SizedBox(
            height: 24,
          ),

          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: kBlackColor,
              borderRadius: BorderRadius.circular(8),
            ),

            child: Text(
              time,
              style: primaryTextStyle.copyWith(
                fontSize: 80,
                fontWeight: medium,
              ),
            ),
          ),
        ],
      );

//NOTE : LOCAL WIDGET TO SET BUTTON TIME CAN USE START, STOP, RESUME, and CANCEL 
  Widget buttonTime() {
    //NOTE : SET ACTIVE RUNNING
    final isRunning = timer == null ? false : timer!.isActive;

    // NOTE : RESET DATA FROM TIME IF CANCEL
    final isCompleted = duration.inSeconds == 0;

    // ignore: dead_code
    //NOTE : SET DATA IF RUNNING OR COMPLETED
    return isRunning || !isCompleted
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //NOTE : SET DATA FROM WIDGETS 'lib/apps/widgets/custom_button_item.dart'
              CustomButtonItem(
                //NOTE : SET TITLE IF RUNNING IS ACTIVE
                title: isRunning ? 'Stop' : 'Resume',

                //NOTE : SET ONCLICKED IF RUNNING IS ACTIVE
                onClicked: () {
                  if (isRunning) {
                    stopTimer(resets: false);
                  } else {
                    startTime(resets: false);
                  }
                },
                //NOTE : SET BACKGROUND IF RUNNING IS ACTIVE
                btnBackgroundColor: isRunning ? kRedSameColor : kGreenSameColor,
                //NOTE : SET TEXT COLOR IF RUNNING IS ACTIVE
                btnTextColor: isRunning ? kRedColor : kGreenColor,

              ),
              //NOTE : SET DATA FROM WIDGETS 'lib/apps/widgets/custom_button_item.dart'
              CustomButtonItem(
                title: 'Cancel',
                onClicked: stopTimer,
                btnBackgroundColor: kGreyColor,
                btnTextColor: kBlackColor,
              ),
            ],
          )
          //NOTE : SET DATA FROM WIDGETS 'lib/apps/widgets/custom_button_item.dart'
        : CustomButtonItem(
            title: 'Start Time',
            onClicked: () {
              startTime();
            },
            btnBackgroundColor: kSecondaryColor,
            btnTextColor: kPrimaryColor,
          );
  }
}
