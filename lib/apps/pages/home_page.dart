import 'package:analog_clock/analog_clock.dart';
import 'package:bibit_alarm/shared/theme.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simple_shadow/simple_shadow.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // NOTE : FIELD FOR TIME
  late String time;
  @override

  // NOTE : GET TIME
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());
  }

// NOTE : SET TIME NOW
  void _getTime() {
    final String formattedDateTime =
        DateFormat('EEEE, dd-MM-yyyy').format(DateTime.now()).toString();
    setState(() {
      time = formattedDateTime;
      // ignore: avoid_print
      print(time);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // NOTE : SET BACKGROUND
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              // NOTE : WIDGET FOR CUSTOM SHADOW FROM PUB.GET
              child: SimpleShadow(
                opacity: 0.6,
                color: kSecondaryColor,
                offset: const Offset(2, 2),
                sigma: 10,

                // NOTE : WIDGET ANALOG CLOCK FROM PUB.GET
                child: AnalogClock(
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  width: 200.0,
                  height: 200.0,
                  isLive: true,
                  hourHandColor: kPrimaryColor,
                  minuteHandColor: kPrimaryColor,
                  secondHandColor: kRedColor,
                  showSecondHand: true,
                  tickColor: kPrimaryColor,
                  numberColor: kPrimaryColor,
                  showNumbers: true,
                  textScaleFactor: 1.0,
                  showTicks: true,
                  showDigitalClock: false,
                  datetime: DateTime.now(),
                ),
              ),
            ),

            const SizedBox(
              height: 30,
            ),

            // NOTE : WIDGET FOR CUSTOM SHADOW FROM PUB.GET
            SimpleShadow(
              opacity: 0.6, // Default: 0.5
              color: kSecondaryColor, // Default: Black
              offset: const Offset(2, 2), // Default: Offset(2, 2)
              sigma: 10,

              child: Column(
                children: [
                  // NOTE : TIMEZONE
                  Text(
                    'Waktu Indonesia Barat',
                    style: primaryTextStyle.copyWith(
                      fontWeight: semiBold,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(
                    height: 8,
                  ),

                  // NOTE : GETTING DATA TO STRING FROM SET TIME
                  Text(
                    time.toString(),
                    style: primaryTextStyle.copyWith(
                      fontWeight: regular,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
