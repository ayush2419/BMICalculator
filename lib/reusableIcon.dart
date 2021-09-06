import 'package:flutter/material.dart';
import 'constants.dart';

class iconContent extends StatelessWidget {
  iconContent(
      {this.icon,
      required this.iconLabel,
      this.iconColour = kIconInactiveColour,
      this.iconTextStyle = kLabelTextStyle});

  final IconData? icon;
  final String iconLabel;
  final Color? iconColour;
  final TextStyle? iconTextStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.00,
          color: iconColour,
        ),
        SizedBox(
          height: 15.00,
        ),
        Text(
          iconLabel,
          style: iconTextStyle,
        ),
      ],
    );
  }
}
