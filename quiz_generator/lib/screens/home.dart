import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Quiz Generator'),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/config'),
                child: const Text("Configurar")),
            ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/quiz'),
                child: const Text("Gerar Quiz")),
          ]),
        ));
  }
}
