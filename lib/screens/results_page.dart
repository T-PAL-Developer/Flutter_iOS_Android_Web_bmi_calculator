import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/custom_widgets/red_button.dart';
import 'package:bmi_calculator/custom_widgets/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 10.0),
              child: Center(
                child: Text(
                  'Your Result',
                  style: kTitleTextStyle,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Normal',
                    style: kResultTextStyle,
                  ),
                  Text(
                    '14.4',
                    style: kBMITextStyle,
                  ),
                  Text(
                    'Your BMI is quite small, you should eat something for sure ',
                    style: kBodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          RedButton(
              onTap: () {
                Navigator.pop(context);
              },
              buttonTitle: 'Re-calculate'.toUpperCase())
        ],
      ),
    );
  }
}
