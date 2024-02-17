import 'package:flutter/material.dart';

import '../constants.dart';
import '../reusable_ card.dart';

class HeightCard extends StatefulWidget {
  const HeightCard({super.key});

  @override
  State<HeightCard> createState() => _HeightCardState();
}

class _HeightCardState extends State<HeightCard> {
  void changeSelectedState(CardTypes cardTypes) {
    setState(() {
      kSelectedCard = cardTypes;
    });
  }

  String cmToInches(int cm) {
    final inches = ((cm / 2.54).round());
    int ft = inches ~/ 12;
    var remainingInches = inches % 12;
    return '$ft\'$remainingInches';
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ReusableCard(
            action: changeSelectedState,
            topGradient: kSelectedCard == CardTypes.height
                ? kSelectedTopColor
                : ktopColor,
            blurColor: kSelectedCard == CardTypes.height
                ? kselectedCardGlow
                : kcardGlow,
            cardType: CardTypes.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'HEIGHT',
                  style: kIconTextStyle(),
                ),
                Row(
                  textBaseline: TextBaseline.alphabetic,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(cmToInches(kHeight.round()), style: kiconNumberStyle),
                    const Text('in')
                  ],
                ),
                SliderTheme(
                  data: const SliderThemeData(
                      activeTrackColor: Colors.white,
                      thumbColor: Colors.pink,
                      overlayColor: Color(0xB3A40E39),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15)),
                  child: Slider(
                      min: 100,
                      max: 230,
                      value: kHeight.toDouble(),
                      onChanged: (double value) {
                        setState(() {
                          changeSelectedState(CardTypes.height);
                          kHeight = value;
                        });
                      }),
                )
              ],
            )));
  }
}
