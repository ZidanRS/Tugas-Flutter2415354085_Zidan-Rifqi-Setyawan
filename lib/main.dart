import 'package:flutter/material.dart';
import 'screens/list_profile.dart'; // <-- Path import diubah menyesuaikan folder baru

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const ListProfile(),
    );
  }
}
