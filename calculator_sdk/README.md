# Calculator SDK

간단한 사칙연산 기능을 제공하는 Flutter 패키지입니다.

## 설치

`pubspec.yaml`에 의존성을 추가합니다:

```yaml
dependencies:
  calculator_sdk:
    git:
      url: https://github.com/shinseunguk/flutter_sdk_example.git
      path: calculator_sdk
```

## 사용법

```dart
import 'package:calculator_sdk/calculator_sdk.dart';

final calculator = Calculator();

// 덧셈
calculator.add(2, 3);       // 5.0

// 뺄셈
calculator.subtract(5, 3);  // 2.0

// 곱셈
calculator.multiply(3, 4);  // 12.0

// 나눗셈
calculator.divide(10, 2);   // 5.0
```

## API

| 메서드 | 설명 |
|--------|------|
| `add(a, b)` | 두 수를 더합니다 |
| `subtract(a, b)` | a에서 b를 뺍니다 |
| `multiply(a, b)` | 두 수를 곱합니다 |
| `divide(a, b)` | a를 b로 나눕니다 (0으로 나누면 `ArgumentError` 발생) |
