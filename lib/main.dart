import 'package:flutter/material.dart';
import 'Security Overview/Security_deshboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: const Color(0xFF070B1D),
      ),
      home: const SecurityDashboard(),
    );
  }
}
