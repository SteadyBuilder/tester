//import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Todo {
  final String id;
  final String title;
  bool isDone;

  Todo({required this.id, required this.title, this.isDone = false});
}

// ✅ StateNotifier를 사용한 Todo 리스트 관리
class TodoNotifier extends StateNotifier<List<Todo>> {
  TodoNotifier() : super([]);

  // 할 일 추가
  void addTodo(String title) {
    final newTodo = Todo(id: DateTime.now().toString(), title: title);
    state = [...state, newTodo];
  }

  // 할 일 상태 업데이트 (완료 처리)
  void toggleTodo(String id) {
    state = state.map((todo) {
      if (todo.id == id) {
        return Todo(id: todo.id, title: todo.title, isDone: !todo.isDone);
      } else {
        return todo;
      }
    }).toList();
  }

  // 할 일 삭제
  void deleteTodo(String id) {
    state = state.where((todo) => todo.id != id).toList();
  }
}

// ✅ StateNotifierProvider로 상태 등록
final todoProvider = StateNotifierProvider<TodoNotifier, List<Todo>>((ref) {
  return TodoNotifier();
});
