import 'package:flutter/material.dart';
import 'constants.dart';

class HeadCard extends StatelessWidget {
  HeadCard({this.angelCard, this.iconCard, this.textCard});
  final IconData iconCard;
  final String textCard;
  final double angelCard;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Transform.rotate(
          angle: angelCard,
          child: Icon(
            iconCard,
            size: 80.0,
          ),
        ),
        Text(
          textCard,
          style: kTextStyleCard,
        )
      ],
    );
  }
}
