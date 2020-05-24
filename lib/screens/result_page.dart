import 'package:bmi_calc/component/bootom_button.dart';
import 'package:bmi_calc/component/card_custom.dart';
import 'package:bmi_calc/component/constants.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  ResultPage({@required this.bmiResult,@required this.bmiText,@required this.inter});
  final String bmiResult;
  final String bmiText;
  final String inter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: Text(
                  'Your Result',
                  style: kTitle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: CardBack(
                colorBack: kActiveColorContainer,
                contentCard: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      bmiText.toUpperCase(),
                      style: kResultText,
                    ),
                    Text(
                      bmiResult,
                      style: kBMITExtStyle,
                    ),
                    Text(
                      inter.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: kBodyStyle,
                    ),
                  ],
                ),
              ),
            ),
            BottomButton(
                title: 'Re-CALCULATOR',
                onTap: () {
                  Navigator.pop(context);
                }),
          ],
        ));
  }
}
