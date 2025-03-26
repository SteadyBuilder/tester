import 'package:dio/dio.dart';

final dio = Dio(
  BaseOptions(
    baseUrl: 'https://jsonplaceholder.typicode.com',
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 5),
    headers: {
      'Content-Type': 'application/json',
    },
  ),
);

Future<void> fetchPost() async {
  try {
    final response =
        await dio.get('https://jsonplaceholder.typicode.com/posts/1');
    print('제목: ${response.data['title']}');
  } catch (e) {
    print('에러 발생: $e');
  }
}

void main() {
  fetchPost();
}
