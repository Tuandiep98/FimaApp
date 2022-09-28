import 'package:flutter/material.dart';

class Dot extends StatelessWidget {
  final Color color;
  const Dot({Key key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      color: color ?? Colors.red,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 7,
        height: 7,
        decoration: BoxDecoration(
          color: color ?? Colors.red,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
