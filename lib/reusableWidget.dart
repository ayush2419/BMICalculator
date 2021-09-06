import 'package:flutter/material.dart';

class ReusableBox extends StatelessWidget {
  ReusableBox({required this.colour, this.cardChild, this.onPress});

  final Color colour;
  final Widget? cardChild;
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress, // parameter for gesture detector
      child: Container(
        child: cardChild,
        margin: EdgeInsetsDirectional.all(15.00),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.00),
        ),
      ),
    );
  }
}
