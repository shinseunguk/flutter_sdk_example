import 'package:flutter_test/flutter_test.dart';

import 'package:calculator_sdk/calculator_sdk.dart';

void main() {
  group('Calculator', () {
    late Calculator calculator;

    setUp(() {
      calculator = Calculator();
    });

    test('add returns sum of two numbers', () {
      expect(calculator.add(2, 3), 5);
      expect(calculator.add(-7, 1), -6);
      expect(calculator.add(0, 0), 0);
    });

    test('subtract returns difference of two numbers', () {
      expect(calculator.subtract(5, 3), 2);
      expect(calculator.subtract(-7, -3), -4);
    });

    test('multiply returns product of two numbers', () {
      expect(calculator.multiply(3, 4), 12);
      expect(calculator.multiply(-2, 3), -6);
    });

    test('divide returns quotient of two numbers', () {
      expect(calculator.divide(10, 2), 5);
      expect(calculator.divide(-6, 3), -2);
    });

    test('divide throws ArgumentError when dividing by zero', () {
      expect(() => calculator.divide(10, 0), throwsArgumentError);
    });
  });
}
