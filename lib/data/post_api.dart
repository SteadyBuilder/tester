import 'package:dio/dio.dart';
import 'package:tester/model/post.dart';

class PostApi {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://jsonplaceholder.typicode.com',
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 5),
    headers: {'Content-Type': 'application/json'},
  ));

  Future<Post> fetchPost(int id) async {
    try {
      final response = await _dio.get('/posts/$id');
      return Post.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        throw '서버 에러: ${e.response?.statusCode}';
      } else {
        throw '연결 에러: ${e.message}';
      }
    }
  }
}

final postApi = PostApi();
