import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/counter_provider.dart';
import '../providers/theme_provider.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  CounterScreenState createState() => CounterScreenState();
}

class CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Counter App"),
        actions: [
          IconButton(
            icon: Icon(
              context.watch<ThemeProvider>().themeMode == ThemeMode.dark
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
            style: ButtonStyle(),
            onPressed: () => context.read<ThemeProvider>().toggleTheme(),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "현재 카운트",
              style: TextStyle(fontSize: 20),
            ),
            Consumer<CounterProvider>(
              builder: (context, provider, child) {
                return Text(
                  "${provider.counter}", // 상태 값 가져오기
                  style: const TextStyle(
                      fontSize: 40, fontWeight: FontWeight.bold),
                );
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => context.read<CounterProvider>().decrement(),
                  child: const Text("-1 감소"),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => context.read<CounterProvider>().increment(),
                  child: const Text("+1 증가"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
