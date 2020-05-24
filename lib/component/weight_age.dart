import 'package:bmi_calc/component/round_button.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IncrementDecrement extends StatelessWidget {
  IncrementDecrement({this.headLine, this.numberWorA, this.onPressedPlus,this.onPressedMiuns});
  final String headLine;
  final int numberWorA;
  final Function onPressedPlus;
  final Function onPressedMiuns;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          headLine,
          style: kTextStyleCard,
        ),
        Text(
          '$numberWorA',
          style: kTextBigInContainer,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RoundIconButton(
              icon: FontAwesomeIcons.plus,
              onPress: onPressedPlus,
            ),
            RoundIconButton(
              icon: FontAwesomeIcons.minus,
              onPress: onPressedMiuns,
            )
          ],
        )
      ],
    );
  }
}