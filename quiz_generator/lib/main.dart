import 'package:flutter/material.dart';
import 'package:quiz_generator/screens/config.dart';
import 'package:quiz_generator/screens/home.dart';
import 'package:quiz_generator/screens/quiz.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const Home(),
        '/config': (_) => const Config(),
        '/quiz': (_) => const Quiz(),
      },
    );
  }
}
