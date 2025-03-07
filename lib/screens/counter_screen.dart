import 'package:flutter/material.dart';
import '../widgets/counter_display.dart';
import '../widgets/counter_buttons.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Riverpod Counter App")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CounterDisplay(),
            const SizedBox(height: 20),
            CounterButtons(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/new');
              },
              child: const Text("이동하기"),
            ),
          ],
        ),
      ),
    );
  }
}
