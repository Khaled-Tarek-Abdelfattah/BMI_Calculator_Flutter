import 'package:bmi_calculator/Services/Bmi_Brain.dart';
import 'package:bmi_calculator/Screens/Result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Services/Reusable.dart';
import '../Services/Constants.dart';

enum GenderType {
  male,
  female,
  uninitialized,
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int age = 20;
  int height = 170;
  int weight = 75;
  GenderType selectedGender = GenderType.uninitialized;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 4,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = GenderType.male;
                        });
                      },
                      child: ReusableCard(
                        colour: selectedGender == GenderType.male
                            ? kActiveColor
                            : kInactiveColor,
                        cardChild:
                            Child(icon: FontAwesomeIcons.mars, text: 'Male'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = GenderType.female;
                        });
                      },
                      child: ReusableCard(
                        colour: selectedGender == GenderType.female
                            ? kActiveColor
                            : kInactiveColor,
                        cardChild:
                            Child(icon: FontAwesomeIcons.venus, text: 'Female'),
                      ),
                    ),
                  ),
                ]),
          ),
          Expanded(
            flex: 4,
            child: ReusableCard(
              colour: kActiveColor,
              cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Height',
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.w500,
                          color: kLabelColor,
                        )),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text('$height', style: kNumberTextStyle),
                          Text(
                            ' cm',
                            style: kLabelTextStyle,
                          ),
                        ]),
                    SliderTheme(
                      data: SliderThemeData(
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 15.0,
                        ),
                        overlayShape: RoundSliderOverlayShape(
                          overlayRadius: 30.0,
                        ),
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        activeTrackColor: Color(0xFFEB1555),
                        inactiveTrackColor: Color(0xFF8D8E98),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        divisions: 130,
                        min: 90.0,
                        max: 220.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.toInt();
                          });
                        },
                      ),
                    ),
                  ]),
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Weight',
                            style: kLabelTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text('$weight', style: kNumberTextStyle),
                              Text(
                                ' kg',
                                style: kLabelTextStyle,
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: RawIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPress: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                ),
                              ),
                              Expanded(
                                child: RawIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPress: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Age',
                            style: kLabelTextStyle,
                          ),
                          Center(child: Text('$age', style: kNumberTextStyle)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: RawIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPress: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                ),
                              ),
                              Expanded(
                                child: RawIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPress: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ]),
          ),
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: () {setState(() {
                  BmiBrain bmiBrain=BmiBrain(height, weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context)=>ResultPage(
                      bmi:bmiBrain.bmiCalculate(),
                      text1: bmiBrain.getResultText(),
                      text2: bmiBrain.getInterpretation(),
                    ),
                  )
                );
              });
              },
              child: Container(
                margin: EdgeInsets.only(top: 15.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFEB1555),
                ),
                child: Center(
                    child: Text(
                  'Calculate',
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
