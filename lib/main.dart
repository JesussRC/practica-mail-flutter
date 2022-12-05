import 'package:flutter/material.dart';
import 'screens/list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buzon App',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Color.fromARGB(255, 144, 0, 255),
          secondary: Color.fromARGB(255, 255, 130, 255),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const ListScreen(title: 'Practica - Guiada mock mail'),
    );
  }
}
// const ListScreen(title: 'Mail Box')