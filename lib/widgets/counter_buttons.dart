import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/counter_provider.dart';

class CounterButtons extends ConsumerWidget {
  const CounterButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () => ref.read(counterProvider.notifier).state--,
          child: const Text("-1 감소"),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: () => ref.read(counterProvider.notifier).state++,
          child: const Text("+1 증가"),
        ),
      ],
    );
  }
}
