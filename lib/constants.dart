import 'dart:ffi';

import 'package:flutter/material.dart';
import 'pages/colorpallate.dart';

TextStyle kIconTextStyle(
        {Color color = Colors.white, double fontSize = 30.0}) =>
    TextStyle(fontSize: fontSize, color: color);

TextStyle kResultsBodyTextStyle =
    const TextStyle(fontSize: 22, fontWeight: FontWeight.w700);
ColorScheme kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color(0xFF1d1E33));
const TextStyle kResultsTitleTextStyle =
    TextStyle(fontSize: 40, fontWeight: FontWeight.w900);
const TextStyle kBMITitleTextStyle =
    TextStyle(fontSize: 90, fontWeight: FontWeight.w900);

const Color kcardGlow = Colors.white60;
const Color kselectedCardGlow = Colors.white60;
ColorPallate kcolorPallate = ColorPallate();
bool kcpPageIsVisible = false;
const Color ktopColor = Color(0xFF1d1E33);
const Color kSelectedTopColor = Color(0xFF15158F);
const kiconNumberStyle = TextStyle(fontSize: 50, fontWeight: FontWeight.w900);
double kHeight = 180;
int kWeight = 110;
int kAge = 18;

enum CardTypes { male, female, height, weight, age }

enum incrementButton { plus, minus }

CardTypes? kSelectedCard;
