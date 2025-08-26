import 'package:flutter/material.dart';
import 'package:movie_info_app/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      //🌙 앱 전체 다크 모드 고정
      theme: ThemeData.dark(),
      themeMode: ThemeMode.dark,

      home: const Home(),
    );
  }
}
