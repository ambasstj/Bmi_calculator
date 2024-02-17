import 'package:bmi_calculator/reusable_%20card.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

import '../buttons/calculate_button.dart';
import '../calculator_brain.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage(
      {super.key,
      this.category = 'You are the picture of health',
      this.bmi,
      this.advice = "Healthy!"});

  final String category;
  final String advice;
  final String? bmi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'YOUR RESULTS',
                  style: kResultsTitleTextStyle,
                ),
                Expanded(
                  child: ReusableCard(
                    blurColor: Colors.transparent,
                    child: Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            category.toUpperCase(),
                            textAlign: TextAlign.center,
                            style: kIconTextStyle(
                                color: Colors.green, fontSize: 40),
                          ),
                          Text(
                            bmi!,
                            textAlign: TextAlign.center,
                            style: kBMITitleTextStyle,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              advice.toUpperCase(),
                              style: kResultsBodyTextStyle,
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                CalculateButton(
                    title: 'RE-CALCULATE',
                    onPress: () {
                      Navigator.pop(context);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
