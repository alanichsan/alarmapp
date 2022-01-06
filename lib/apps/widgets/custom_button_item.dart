import 'package:bibit_alarm/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomButtonItem extends StatelessWidget {
  final String title;
  final Function() onClicked;
  final Color btnBackgroundColor;
  final Color btnTextColor;

  const CustomButtonItem({
    Key? key,
    required this.title,
    required this.onClicked,
    required this.btnBackgroundColor,
    required this.btnTextColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onClicked,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(btnBackgroundColor),
      ),
      child: Text(
        title,
        style: primaryTextStyle.copyWith(
          fontSize: 16,
          fontWeight: medium,
          color: btnTextColor,
        ),
      ),
    );
  }
}
