import 'package:flutter/material.dart';

import '../constants.dart';

class CalculateButton extends StatelessWidget {
  const CalculateButton({
    super.key,
    this.title = 'Button',
    required this.onPress,
  });

  final String title;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: GestureDetector(
        onTap: () {
          onPress();
        },
        child: Container(
          color: Colors.purple,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: kIconTextStyle(),
          ),
        ),
      ),
    );
  }
}
