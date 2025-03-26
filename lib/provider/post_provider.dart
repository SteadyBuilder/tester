import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tester/data/post_api.dart';
import 'package:tester/model/post.dart';

final postProvider = FutureProvider<Post>((ref) async {
  return await postApi.fetchPost(1);
});
