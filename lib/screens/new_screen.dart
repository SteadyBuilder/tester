import 'package:flutter/material.dart';
import '../widgets/counter_display.dart';
import '../widgets/counter_buttons.dart';

class NewScreen extends StatelessWidget {
  const NewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("New Screen")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CounterDisplay(),
            const SizedBox(height: 20),
            CounterButtons(),
            const SizedBox(height: 20),

            // 새로운 화면으로 이동 버튼 (네임드 라우트 사용)
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: const Text("돌아가기"),
            ),
          ],
        ),
      ),
    );
  }
}
