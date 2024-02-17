import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';
import '../pages/main.dart';

class IncrementButton extends StatefulWidget {
  const IncrementButton({super.key});

  @override
  State<IncrementButton> createState() => _IncrementButtonState();
}

class _IncrementButtonState extends State<IncrementButton> {
  void incrementWeight(incrementButton button) {
    setState(() {
      if (button == incrementButton.plus) {
        kWeight++;
      } else {
        kWeight--;
      }
    });
  }

  void longPressIncrement(incrementButton button) {
    setState(() {
      if (button == incrementButton.plus) {
        kWeight += 10;
        print('long press was activated');
      } else {
        kWeight -= 10;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RoundMaterialButton(
          button: incrementButton.plus,
          onPress: () {
            incrementWeight(incrementButton.plus);
          },
          onLongPress: () {
            longPressIncrement(incrementButton.plus);
          },
          child: FontAwesomeIcons.plus,
        ),
        const SizedBox(
          width: 12,
        ),
        RoundMaterialButton(
          button: incrementButton.minus,
          onPress: () {
            incrementWeight(incrementButton.minus);
          },
          child: FontAwesomeIcons.minus,
        )
      ],
    );
  }
}

class RoundMaterialButton extends StatelessWidget {
  const RoundMaterialButton(
      {super.key,
      this.child,
      required this.button,
      required this.onPress,
      this.onLongPress});

  final IconData? child;
  final incrementButton button;
  final Function onPress;
  final Function? onLongPress;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: () {
          onPress();
        },
        onLongPress: () {
          onLongPress!();
        },
        shape: const CircleBorder(),
        color: kColorScheme.secondary,
        minWidth: 45,
        height: 45,
        child: FaIcon(child));
  }
}
