import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '/models/post_model.dart';

final postProvider = FutureProvider<List<Post>>((ref) async {
  final url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final List<dynamic> jsonData = jsonDecode(response.body);
    return jsonData.map((json) => Post.fromJson(json)).toList();
  } else {
    throw Exception("데이터 불러오기 실패");
  }
});
