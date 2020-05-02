import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final Decoration boxDecoration;
  final Function onPress;

  const CustomButton({
    Key key,
    this.child,
    this.width,
    this.height,
    this.boxDecoration,
    this.onPress
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: boxDecoration,
        child: child,
      ),
    );
  }
}