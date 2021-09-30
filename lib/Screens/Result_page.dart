import 'package:bmi_calculator/Services/Constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/Services/Reusable.dart';

class ResultPage extends StatelessWidget {
  final double bmi;
  final String text1;
  final String text2;
  ResultPage({required this.bmi,required this.text1,required this.text2});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Result',
          style: kLabelTextStyle,
        )),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: ReusableCard(
              colour: kActiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: SizedBox(
                    height: 150.0,
                  )),
                  Expanded(
                    flex: 1,
                    child: Text(text1,
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.greenAccent,
                        )),
                  ),
                  Expanded(
                    flex: 3,
                    child: Center(
                      child: Text(
                        bmi.toStringAsFixed(1),
                        style: kNumberTextStyle,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(text2,
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        )),
                  ),
                  Expanded(
                      child: SizedBox(
                    height: 150.0,
                  )),
                ],
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin: EdgeInsets.only(top: 15.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFFEB1555),
                  ),
                  child: Center(
                      child: Text(
                    'Recalculate',
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                    ),
                  )),
                ),
              ))
        ],
      ),
    );
  }
}
