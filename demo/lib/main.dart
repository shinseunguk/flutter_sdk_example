import 'package:flutter/material.dart';
import 'package:calculator_sdk/calculator_sdk.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator SDK Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const CalculatorDemo(),
    );
  }
}

class CalculatorDemo extends StatefulWidget {
  const CalculatorDemo({super.key});

  @override
  State<CalculatorDemo> createState() => _CalculatorDemoState();
}

class _CalculatorDemoState extends State<CalculatorDemo> {
  final Calculator _calculator = Calculator();
  final TextEditingController _aController = TextEditingController(text: '10');
  final TextEditingController _bController = TextEditingController(text: '5');
  String _result = '';

  void _calculate(String operation) {
    final a = double.tryParse(_aController.text) ?? 0;
    final b = double.tryParse(_bController.text) ?? 0;

    setState(() {
      try {
        switch (operation) {
          case '+':
            _result = '${_calculator.add(a, b)}';
            break;
          case '-':
            _result = '${_calculator.subtract(a, b)}';
            break;
          case '*':
            _result = '${_calculator.multiply(a, b)}';
            break;
          case '/':
            _result = '${_calculator.divide(a, b)}';
            break;
        }
      } catch (e) {
        _result = 'Error: $e';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Calculator SDK Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _aController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'A',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    controller: _bController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'B',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _calculate('+'),
                  child: const Text('+'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('-'),
                  child: const Text('-'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('*'),
                  child: const Text('*'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('/'),
                  child: const Text('/'),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Text(
              'Result: $_result',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}
