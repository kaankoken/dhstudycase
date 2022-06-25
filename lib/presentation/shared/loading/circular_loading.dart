import 'package:flutter/material.dart';

class CircularLoading extends StatelessWidget {
  final Color color;
  final double? strokeWidth;

  const CircularLoading({Key? key, this.strokeWidth, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: color.withOpacity(0.2),
        valueColor: AlwaysStoppedAnimation(color),
        strokeWidth: strokeWidth ?? 2.0,
      ),
    );
  }
}
