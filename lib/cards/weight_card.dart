import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';
import '../pages/main.dart';
import '../reusable_ card.dart';

class WeightCard extends StatefulWidget {
  const WeightCard({super.key});

  @override
  State<WeightCard> createState() => _WeightCardState();
}

class _WeightCardState extends State<WeightCard> {
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

  void changeSelectedState(CardTypes cardTypes) {
    setState(() {
      kSelectedCard = cardTypes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ReusableCard(
        action: changeSelectedState,
        topGradient:
            kSelectedCard == CardTypes.weight ? kSelectedTopColor : ktopColor,
        blurColor:
            kSelectedCard == CardTypes.weight ? kselectedCardGlow : kcardGlow,
        cardType: CardTypes.weight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'WEIGHT',
              style: kIconTextStyle(),
            ),
            Text(
              kWeight.toString(),
              style: kiconNumberStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundWeightButton(
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
                RoundWeightButton(
                  button: incrementButton.minus,
                  onPress: () {
                    incrementWeight(incrementButton.minus);
                  },
                  child: FontAwesomeIcons.minus,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class RoundWeightButton extends StatelessWidget {
  const RoundWeightButton(
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
