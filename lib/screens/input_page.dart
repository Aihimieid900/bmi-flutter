import 'package:bmi_calc/calculat_brain.dart';
import 'package:bmi_calc/component/bootom_button.dart';
import 'package:bmi_calc/component/card_custom.dart';
import 'package:bmi_calc/component/constants.dart';
import 'package:bmi_calc/component/head_card.dart';
import 'package:bmi_calc/component/weight_age.dart';

import 'package:bmi_calc/enums.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calc/screens/result_page.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // Height For Gender
  num height = 100.0;
  int weight = 74;
  int age = 19;
  // Gender For Calculator
  Gender selectedGender;
  updateGender(Gender selected) {
    setState(() {
      selectedGender = selected;
    });
  }

  // Gender to Calculator
  incrementWeight() {}

  decrementWeight() {
    setState(() {
      weight--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: CardBack(
                    onPress: () {
                      updateGender(Gender.male);
                    },
                    colorBack: selectedGender == Gender.male
                        ? kActiveColorContainer
                        : kInActiveColorContainer,
                    contentCard: HeadCard(
                      angelCard: 0,
                      iconCard: FontAwesomeIcons.mars,
                      textCard: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                    child: CardBack(
                  onPress: () {
                    updateGender(Gender.female);
                  },
                  colorBack: selectedGender == Gender.female
                      ? kActiveColorContainer
                      : kInActiveColorContainer,
                  contentCard: HeadCard(
                    angelCard: 70.0,
                    iconCard: FontAwesomeIcons.venus,
                    textCard: 'FEMALE',
                  ),
                )),
              ],
            ),
          ),
          Expanded(
            child: CardBack(
                colorBack: kActiveColorContainer,
                contentCard: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Height',
                      style: kTextStyleCard,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          '${height.toInt()}',
                          style: kTextBigInContainer,
                        ),
                        Text(
                          ' cm',
                          style: kTextStyleCard,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Colors.grey,
                          thumbColor: Color(0xFFEB1555),
                          overlayColor: Color(0x29EB1555),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 16.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0)),
                      child: Slider(
                        value: height,
                        onChanged: (double cm) {
                          setState(() => height = cm);
                        },
                        min: 100,
                        max: 250,
                      ),
                    ),
                  ],
                )),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: CardBack(
                    colorBack: kActiveColorContainer,
                    contentCard: Center(
                      child: IncrementDecrement(
                        headLine: 'WEIGHT',
                        numberWorA: weight,
                        onPressedPlus: () {
                          setState(() {
                            weight++;
                          });
                        },
                        onPressedMiuns: () {
                          setState(() {
                            weight--;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: CardBack(
                    colorBack: kActiveColorContainer,
                    contentCard: Center(
                      child: IncrementDecrement(
                        headLine: 'AGE',
                        numberWorA: age,
                        onPressedPlus: () {
                          setState(() {
                            age++;
                          });
                        },
                        onPressedMiuns: () {
                          setState(() {
                            age--;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            title: 'CALCULATOR',
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height.toInt(), weight: weight);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                            bmiResult: calc.calculatorBMI(),
                            bmiText: calc.getResult(),
                            inter: calc.getIntergratation(),
                          )));
            },
          )
        ],
      ),
    );
  }
}
