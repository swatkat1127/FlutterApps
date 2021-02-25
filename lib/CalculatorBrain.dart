import 'dart:math';

class CalculatorBrain {

  CalculatorBrain({ this.height, this.weight});

  final int height;
  final int weight;

  double _bmi;
  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(2);
  }

  String getResults() {
    if (_bmi >= 25) {
      return 'OVERWEIGHT';
    } else if (_bmi > 18.5) {
      return 'NORMAL';
    } else {
      return 'ABNORMAL';
    }
  }


String getInterpretations() {
  if ( _bmi >= 25) {
    return 'DO exercise regularly';
  } else if (_bmi > 18.5) {
    return 'Good JOb';
  } else {
    return 'Eat More';
  }
}
}