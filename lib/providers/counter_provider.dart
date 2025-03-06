import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _counter = 0; // 상태 변수

  int get counter => _counter; // 상태 값을 가져오기 (게터)

  void increment() {
    _counter++; // 값 증가
    notifyListeners(); // UI 업데이트 요청
  }

  void decrement() {
    _counter--; // 값 감소
    notifyListeners(); // UI 업데이트 요청
  }
}
