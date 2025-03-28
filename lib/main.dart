import 'dart:convert';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: JsonListViewExample(),
  ));
}

class JsonListViewExample extends StatelessWidget {
  const JsonListViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    // JSON 형식의 문자열: 사용자 10명의 정보
    const jsonString = '''
	[
	  {"name": "Alice Kim", "age": 27, "job": "Frontend Developer"},
	  {"name": "Bob Lee", "age": 34, "job": "UI/UX Designer"},
	  {"name": "Charlie Park", "age": 29, "job": "Project Manager"},
	  {"name": "Diana Choi", "age": 32, "job": "Mobile Developer"},
	  {"name": "Ethan Jung", "age": 41, "job": "QA Tester"},
	  {"name": "Fiona Lim", "age": 25, "job": "AI Researcher"},
	  {"name": "George Han", "age": 38, "job": "DevOps Engineer"},
	  {"name": "Hannah Yoo", "age": 30, "job": "Product Owner"},
	  {"name": "Ian Seo", "age": 36, "job": "Data Analyst"},
	  {"name": "Julia Kang", "age": 28, "job": "Fullstack Developer"}
	]
	''';

    // 문자열을 List<Map<String, dynamic>> 형태로 변환
    final List<dynamic> userList = jsonDecode(jsonString);

    return Scaffold(
      appBar: AppBar(title: const Text('👥 사용자 목록(JSON 리스트)')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: userList.map<Widget>((user) {
          final name = user['name'];
          final age = user['age'];
          final job = user['job'];

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: const Icon(Icons.person),
              title: Text(name,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('나이: $age, 직업: $job'),
            ),
          );
        }).toList(),
      ),
    );
  }
}
