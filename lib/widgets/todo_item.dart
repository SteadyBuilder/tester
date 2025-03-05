import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/todo_provider.dart';

class TodoItem extends StatelessWidget {
  final int index;
  const TodoItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);

    return Card(
      child: ListTile(
        title: Text(todoProvider.tasks[index]),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          color: Colors.red,
          onPressed: () => todoProvider.removeTask(index),
        ),
      ),
    );
  }
}
