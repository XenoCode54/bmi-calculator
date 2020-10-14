import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});
  final int height;
  final int weight;

  double _bmi;

  String result() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String bodyType() {
    if (_bmi >= 25.0) {
      return 'Fat';
    } else if (_bmi >= 18.5) {
      return 'Normal';
    } else {
      return 'Thin';
    }
  }

  String interpretation() {
    if (_bmi >= 25.0) {
      return 'Dude! Why are you eating so much! Hit the gym Now!';
    } else if (_bmi >= 18.5) {
      return "You are my dude because you're like me!";
    } else {
      return 'Gerrara hear joor and Chaw!';
    }
  }
}
