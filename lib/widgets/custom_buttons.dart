import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget child;
  final Decoration boxDecoration;
  final double width;
  final double height;
  final Function onPress;
  
  const CustomButton({
    Key key,
    this.child, 
    this.boxDecoration, 
    this.width, 
    this.height, 
    this.onPress
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        decoration: boxDecoration,
        child: child,
      ),
    );
  }
}