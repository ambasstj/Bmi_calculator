import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';
import '../icon_content.dart';
import '../reusable_ card.dart';

class FemaleCard extends StatefulWidget {
  const FemaleCard({super.key});

  @override
  State<FemaleCard> createState() => _FemaleCardState();
}

class _FemaleCardState extends State<FemaleCard> {
  void changeSelectedState(CardTypes cardTypes) {
    setState(() {
      kSelectedCard = cardTypes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ReusableCard(
            key: const ValueKey('female'),
            action: changeSelectedState,
            topGradient: kSelectedCard == CardTypes.female
                ? kSelectedTopColor
                : ktopColor,
            blurColor: kSelectedCard == CardTypes.female
                ? kselectedCardGlow
                : kcardGlow,
            cardType: CardTypes.female,
            child: const IconContent(
                icon: FontAwesomeIcons.venus, title: 'FEMALE')));
  }
}
