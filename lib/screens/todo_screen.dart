import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/todo_provider.dart';

// ConsumerWidget 상속
class TodoScreen extends ConsumerWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // watch , read 변수
    final todoList = ref.watch(todoProvider);
    final todoNotifier = ref.read(todoProvider.notifier);

    final TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Todo List")),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                // 할 일 입력 TextField
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "할 일 입력",
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                // 할 일 추가 버튼
                ElevatedButton(
                  onPressed: () {
                    if (controller.text.isNotEmpty) {
                      todoNotifier.addTodo(controller.text);
                      controller.clear();
                    }
                  },
                  child: const Text("추가"),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // 할 일 ListView.builder
          Expanded(
            child: ListView.builder(
              itemCount: todoList.length,
              itemBuilder: (context, index) {
                final todo = todoList[index];
                return Card(
                  child: ListTile(
                    title: Text(
                      todo.title,
                      style: TextStyle(
                          decoration:
                              todo.isDone ? TextDecoration.lineThrough : null),
                    ),
                    // 체크박스
                    leading: Checkbox(
                      value: todo.isDone,
                      onChanged: (value) => todoNotifier.toggleTodo(todo.id),
                    ),
                    // 삭제 버튼
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        todoNotifier.deleteTodo(todo.id);
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
