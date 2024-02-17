import 'dart:ffi';
import 'dart:math';

import 'package:bmi_calculator/constants.dart';

class CalculatorBrain {
  double height = kHeight;
  int weight = kWeight;
  double? _bmi;

  CalculatorBrain({required this.height, required this.weight});

  String? getBMI() {
    double weightInKilos = weight / 2.205;
    _bmi = weightInKilos / pow((height / 100), 2);
    return _bmi?.toStringAsFixed(1);
  }

  String advice() {
    if (_bmi! > 30) {
      return 'Eat much less and exercise more';
    } else if (_bmi! > 25) {
      return 'Try exercising more often';
    } else if (_bmi! > 18.5) {
      return 'You\'re the picture of health!';
    } else {
      return 'Try milkshakes before bed!';
    }
  }

  String category() {
    if (_bmi! > 30) {
      return 'Obese';
    } else if (_bmi! > 25) {
      return 'Overweight';
    } else if (_bmi! > 18.5) {
      return 'Healthy!';
    } else {
      return 'Underweight';
    }
  }
}
