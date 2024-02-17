import 'dart:ffi';
import 'package:flutter/material.dart';
import 'pages/main.dart';
import 'constants.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard(
      {super.key,
      this.blurColor = Colors.white60,
      this.child,
      this.topGradient = const Color(0xFF1d1E33),
      this.action,
      this.cardType});

  final void Function(CardTypes)? action;
  final Color blurColor;
  final Widget? child;
  final Color topGradient;
  final CardTypes? cardType;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => action!(cardType!),
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(color: blurColor, blurRadius: 8.3, spreadRadius: 1.2)
            ],
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [topGradient, const Color(0xFF35356C)]),
            borderRadius: BorderRadius.circular(10.0)),
        child: child,
      ),
    );
  }
}
