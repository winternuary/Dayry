import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Diary',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: const Color(0xFFFEFFF1), // 배경 색상 변경
        appBarTheme: const AppBarTheme(
          backgroundColor: const Color(0xFFFEFFF1),
          elevation: 0,
        ),
        cardTheme: const CardTheme(
          color: Colors.white, // 카드 색상
          shadowColor: Colors.black12,
          elevation: 2,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 16, color: Colors.black87), // bodyMedium 사용
        ),
      ),
      home: const HomePage(),
    );
  }
}
