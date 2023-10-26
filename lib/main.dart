import 'package:flutter/material.dart';
import 'package:responsi_a1/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Responsi App',
      home: HomePage(),
    );
  }
}
