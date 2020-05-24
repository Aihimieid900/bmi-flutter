import 'package:bmi_calc/component/constants.dart';
import 'package:flutter/material.dart';
class BottomButton extends StatelessWidget {
  BottomButton({@required this.title, @required this.onTap});
  final String title;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(bottom: 10),
        color: kColorContainerBottom,
        margin: const EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomHeightContainer,
        child: Center(
            child: Text(
          '$title',
          style: kBigTextInBottom,
        )),
      ),
    );
  }
}
