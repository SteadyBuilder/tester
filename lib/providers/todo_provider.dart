import 'package:flutter_riverpod/flutter_riverpod.dart';

class Todo {
  final String id; // 각 할 일의 고유 ID
  final String title; // 할 일의 제목
  bool isDone; // 완료 여부

  Todo({required this.id, required this.title, this.isDone = false});
}

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
      }
      return todo;
    }).toList();
  }

  // 할 일 삭제
  void deleteTodo(String id) {
    state = state.where((todo) => todo.id != id).toList();
  }
}

// StateNotifierProvidre로 상태 등록
final todoProvider = StateNotifierProvider<TodoNotifier, List<Todo>>((ref) {
  return TodoNotifier();
});
