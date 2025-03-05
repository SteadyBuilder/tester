import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoProvider extends ChangeNotifier {
  final List<String> _tasks = [];

  List<String> get tasks => _tasks;

  TodoProvider() {
    _loadTasks(); // 앱 실행 시 저장된 데이터 불러오기
  }

  void _loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    _tasks.clear();
    _tasks.addAll(prefs.getStringList('tasks') ?? []);
    notifyListeners(); // UI 업데이트
  }

  void _saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('tasks', _tasks); // 데이터 저장
  }

  void addTask(String task) {
    _tasks.add(task);
    _saveTasks(); // 저장
    notifyListeners(); // UI 업데이트
  }

  void removeTask(int index) {
    _tasks.removeAt(index);
    _saveTasks(); // 저장
    notifyListeners(); // UI 업데이트
  }
}
