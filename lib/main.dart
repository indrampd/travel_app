import 'package:flutter/material.dart';
import 'package:travel_app/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel App',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF3F5F7),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF3EBACE),
          secondary: const Color(0xFFD8ECF1),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
