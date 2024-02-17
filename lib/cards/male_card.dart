import 'package:flutter/material.dart';
import 'package:bmi_calculator/pages/main.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';
import '../icon_content.dart';
import '../reusable_ card.dart';

class MaleCard extends StatefulWidget {
  const MaleCard({super.key});

  @override
  State<MaleCard> createState() => _MaleCardState();
}

class _MaleCardState extends State<MaleCard> {
  void changeSelectedState(CardTypes cardTypes) {
    setState(() {
      kSelectedCard = cardTypes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ReusableCard(
          key: const ValueKey('male'),
          action: changeSelectedState,
          topGradient:
              kSelectedCard == CardTypes.male ? kSelectedTopColor : ktopColor,
          blurColor:
              kSelectedCard == CardTypes.male ? kselectedCardGlow : kcardGlow,
          cardType: CardTypes.male,
          child: const IconContent(
            icon: FontAwesomeIcons.mars,
            title: 'MALE',
          )),
    );
  }
}
