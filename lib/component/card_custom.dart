import 'package:flutter/material.dart';

class CardBack extends StatelessWidget {
  CardBack({@required this.colorBack,@required this.contentCard,this.onPress});
  final Color colorBack;
  final Widget contentCard;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
          child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colorBack,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: contentCard,
      ),
    );
  }
}
