import 'package:bmi_calculator/buttons/calculate_button.dart';
import 'package:bmi_calculator/buttons/increment_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/cards/male_card.dart';
import 'package:bmi_calculator/cards/height_card.dart';
import 'package:bmi_calculator/cards/weight_card.dart';
import 'package:bmi_calculator/pages/results.dart';
import 'package:bmi_calculator/reusable_%20card.dart';
import 'package:flutter/material.dart';
import '../cards/age_card.dart';
import '../cards/female_card.dart';
import 'colorpallate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../icon_content.dart';
import '../constants.dart';

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePage(),
          '/results': (context) => const ResultsPage()
        },
        theme: ThemeData.dark().copyWith(
            textTheme:
                const TextTheme(bodyMedium: TextStyle(color: Colors.white))));
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ThemeData.dark().primaryColor,
          title: const Text('Home Page'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Expanded(
                child: Row(
                  children: [MaleCard(), FemaleCard()],
                ),
              ),
              const HeightCard(),
              const Expanded(
                child: Row(
                  children: [WeightCard(), AgeCard()],
                ),
              ),
              CalculateButton(
                title: "CALCULATE",
                onPress: () {
                  CalculatorBrain cB =
                      CalculatorBrain(height: kHeight, weight: kWeight);
                  print(cB.height);
                  print(cB.weight);
                  print(cB.getBMI());
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultsPage(
                                advice: cB.advice(),
                                category: cB.category(),
                                bmi: cB.getBMI(),
                              )));
                },
              )
            ],
          ),
        ));
    //TODO: When you come back to this, consider creating a global function that can be triggered when a user presses the FAB in the Material APP. That function should use setState to change the page
  }
}
