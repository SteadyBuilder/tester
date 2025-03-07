import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/counter_screen.dart';
import 'screens/new_screen.dart';

void main() {
  runApp(
      const ProviderScope(child: MyApp())); // Riverpod 사용을 위한 ProviderScope 추가
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Riverpod Counter App",
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
          ),
        ),

        // 초기 화면 설정
        initialRoute: '/',
        // MaterialPageRoute를 사용한 라우팅 설정
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
              return MaterialPageRoute(
                  builder: (context) => const CounterScreen());
            case '/new':
              return MaterialPageRoute(builder: (context) => const NewScreen());
            default:
              return MaterialPageRoute(
                builder: (context) => const Scaffold(
                  body: Center(child: Text("404 Not Found")),
                ),
              );
          }
        });
  }
}
