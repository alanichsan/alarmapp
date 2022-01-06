import 'package:bibit_alarm/apps/pages/alarm_page.dart';
import 'package:bibit_alarm/apps/pages/home_page.dart';
import 'package:bibit_alarm/apps/pages/stopwatch_page.dart';
import 'package:bibit_alarm/apps/widgets/custom_bottom_navigation_item.dart';
import 'package:bibit_alarm/cubits/page_cubit.dart';
import 'package:flutter/material.dart';
import '../../shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // NOTE : LOCAL WIDGET TO BUILD CONTENT OF CUSTOM NAVIGATION BUTTON
    Widget buildCustomNavigationButton(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return const HomePage();
        case 1:
          return const AlarmPage();
        case 2:
          return const StopwatchPage();
        default:
          return const HomePage();
      }
    }

    // NOTE : LOCAL WIDGET TO SET CUSTOM BUTTON NAVIGATION
    Widget customButtonNavigation() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 60,
          margin: const EdgeInsets.only(bottom: 30, left: 24, right: 24),
          decoration: BoxDecoration(
              color: kBlackColor, borderRadius: BorderRadius.circular(15)),

          // NOTE : GET and SET DATA FROM WIDGETS 'lib/apps/widgets/custom_bottom_navigation_item.dart'
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              CustomBottomNavigationItem(
                // NOTE : SET INDEX FROM BUILD CONTENT OF CUSTOM NAVIGATION BUTTON
                index: 0,
                // NOTE : ADD/SHOW IMAGE
                imageUrl: 'assets/icon_home.png',
              ),
              CustomBottomNavigationItem(
                // NOTE : SET INDEX FROM BUILD CONTENT OF CUSTOM NAVIGATION BUTTON
                index: 1,
                // NOTE : ADD/SHOW IMAGE
                imageUrl: 'assets/icon_booking.png',
              ),
              CustomBottomNavigationItem(
                // NOTE : SET INDEX FROM BUILD CONTENT OF CUSTOM NAVIGATION BUTTON
                index: 2,
                // NOTE : ADD/SHOW IMAGE
                imageUrl: 'assets/icon_card.png',
              ),
            ],
          ),
        ),
      );
    }

// NOTE : CONSUME BLOCK TO NAVIGATION BUTTON
    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          // NOTE : SET BACKGROUND
          backgroundColor: kBackgroundColor,
          body: Stack(
            children: [
              // NOTE : CONSUME INDEX FROM BUILD CUSTOM NAVIGATION BUTTON
              buildCustomNavigationButton(currentIndex),
              // NOTE : GETTING DATA CUSTOM  NAVIGATIONBUTTON
              customButtonNavigation(),
            ],
          ),
        );
      },
    );
  }
}
