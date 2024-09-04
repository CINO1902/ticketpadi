import 'package:flutter/material.dart';

class Clickbutton extends StatelessWidget {
  final String title;
  const Clickbutton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xff111827),
          borderRadius: BorderRadius.circular(10)),
      height: 44,
      width: double.infinity,
      child: Center(
          child: Text(
        title,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
      )),
    );
  }
}
