import 'package:bmi_calculator/Services/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Child extends StatelessWidget {
  final String text;
  final IconData icon;
  Child({required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: Icon(
          icon,
          size: 80.0,
        ),
      ),
      Expanded(
        child: SizedBox(
          height: 20.0,
        ),
      ),
      Expanded(
        child: Text(
          text,
          style: kLabelTextStyle,
        ),
      )
    ]);
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard({required this.colour, required this.cardChild});
  final Color colour;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}

class RawIconButton extends StatelessWidget {
  RawIconButton({required this.icon, required this.onPress});
  final IconData icon;
  final Function() onPress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5C),
      onPressed: onPress,
    );
  }
}
