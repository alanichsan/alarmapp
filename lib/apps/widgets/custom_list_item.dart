import 'package:bibit_alarm/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

class CustomListItem extends StatelessWidget {
  final bool checked;
  final String time;
  final String descriptions;
  final String alarmStatus;
  final int status;
  const CustomListItem({
    Key? key,
    this.checked = true,
    required this.time,
    this.descriptions = '',
    this.status = 0,
    this.alarmStatus = 'Menunggu',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    styleStatusAlarm() {
      switch (status) {
        case 0:
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 3),
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
            decoration: BoxDecoration(
                color: kRedSameColor, borderRadius: BorderRadius.circular(2)),
            child: Text(
              'terlewat',
              style: redTextStyle.copyWith(
                fontSize: 9,
                fontWeight: light,
              ),
            ),
          );
        case 1:
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 3),
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
            decoration: BoxDecoration(
                color: kGreenSameColor, borderRadius: BorderRadius.circular(2)),
            child: Text(
              'berlangsung',
              style: greenTextStyle.copyWith(
                fontSize: 9,
                fontWeight: light,
              ),
            ),
          );
        default:
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 3),
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
            decoration: BoxDecoration(
                color: kSecondaryColor, borderRadius: BorderRadius.circular(2)),
            child: Text(
              'menunggu',
              style: primaryTextStyle.copyWith(
                fontSize: 9,
                fontWeight: light,
              ),
            ),
          );
      }
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 15),
      decoration: BoxDecoration(
          color: kBlackColor, borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          RoundCheckBox(
            onTap: (selected) {},
            checkedWidget: const Icon(
              Icons.check,
              size: 14,
            ),
            uncheckedColor: kTansparentColor,
            checkedColor: kPrimaryColor,
            borderColor: kPrimaryColor,
            isChecked: checked,
            size: 20,
          ),
          const SizedBox(
            width: 13,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                time,
                style: whiteTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: regular,
                ),
              ),
              styleStatusAlarm(),
              Text(
                descriptions,
                style: greyTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: regular,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
