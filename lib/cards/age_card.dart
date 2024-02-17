import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../buttons/increment_button.dart';
import '../constants.dart';
import '../pages/main.dart';
import '../reusable_ card.dart';

class AgeCard extends StatefulWidget {
  const AgeCard({super.key});

  @override
  State<AgeCard> createState() => _AgeCardState();
}

class _AgeCardState extends State<AgeCard> {
  void incrementAge(incrementButton button) {
    setState(() {
      if (button == incrementButton.plus) {
        kAge++;
      } else if (button == incrementButton.minus) {
        kAge--;
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
                kSelectedCard == CardTypes.age ? kSelectedTopColor : ktopColor,
            blurColor:
                kSelectedCard == CardTypes.age ? kselectedCardGlow : kcardGlow,
            cardType: CardTypes.age,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'AGE',
                  style: kIconTextStyle(),
                ),
                Text(
                  kAge.toString(),
                  style: kiconNumberStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RoundMaterialButton(
                      button: incrementButton.plus,
                      onPress: () {
                        incrementAge(incrementButton.plus);
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
                        incrementAge(incrementButton.minus);
                      },
                      child: FontAwesomeIcons.minus,
                    )
                  ],
                )
              ],
            )));
  }
}
