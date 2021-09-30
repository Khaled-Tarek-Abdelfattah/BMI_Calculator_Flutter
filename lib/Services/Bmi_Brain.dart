import 'dart:math';
class BmiBrain{
  double _bmi=0;
  int bmiHeight;
  int bmiWidth;
  BmiBrain(this.bmiHeight,this.bmiWidth);
  double bmiCalculate(){
    _bmi=(bmiWidth/pow(bmiHeight/100, 2));
    return _bmi;
  }
  double getBmi() {
    return _bmi;
  }
  String getResultText() {
    if(_bmi>=25)
      return 'Overweight';
    else if(_bmi>18.5)
      return 'Normal';
    else
      return 'Underweight';
  }
  String getInterpretation() {
    if(_bmi>=25)
      return 'Try to do exercises';
    else if(_bmi>18.5)
      return 'keep going';
    else
      return 'Think to eat more!';
  }
}