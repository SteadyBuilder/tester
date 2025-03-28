import 'package:flutter/material.dart';
import 'dart:convert';

void main() {
  runApp(const MaterialApp(
    home: JsonDecodeExample(),
  ));
}

class JsonDecodeExample extends StatelessWidget {
  const JsonDecodeExample({super.key});

  @override
  Widget build(BuildContext context) {
    const jsonString =
        '{"name": "SteadyBuidler", "age": 99, "job": "developer"}';

    final Map<String, dynamic> userMap = jsonDecode(jsonString);

    final name = userMap['name'];
    final age = userMap['age'];
    final job = userMap['job'];

    return Scaffold(
      appBar: AppBar(title: const Text("jsonDecode 예제")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          '이름: $name\n나이: $age\n직업: $job',
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
