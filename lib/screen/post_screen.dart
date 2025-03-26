import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tester/provider/post_provider.dart';

class PostScreen extends ConsumerWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postAsync = ref.watch(postProvider);

    return Scaffold(
        appBar: AppBar(title: const Text("📬 Riverpod + Dio 실습")),
        body: postAsync.when(
          data: (post) => Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text('✅ 제목:', style: Theme.of(context).textTheme.titleLarge),
                Text(post.title, style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 20),
                Text('📄 내용:', style: Theme.of(context).textTheme.titleMedium),
                Text(post.body),
              ],
            ),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, stackTrace) => Center(child: Text("❌ 오류: $err")),
        ));
  }
}
