import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/todo_provider.dart';
import '../widgets/todo_item.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  TodoListScreenState createState() => TodoListScreenState();
}

/////

class TodoListScreenState extends State<TodoListScreen> {
  final TextEditingController _controller = TextEditingController();

  void _addTask() {
    if (_controller.text.isNotEmpty) {
      Provider.of<TodoProvider>(context, listen: false)
          .addTask(_controller.text);
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("할 일 목록")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: "새로운 할 일",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _addTask,
                  child: const Text("추가"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: todoProvider.tasks.isEmpty
                  ? const Center(child: Text("할 일이 없습니다."))
                  : ListView.builder(
                      itemCount: todoProvider.tasks.length,
                      itemBuilder: (context, index) {
                        return TodoItem(index: index);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
