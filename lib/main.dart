import 'package:flutter/material.dart';
import 'package:flutter_bloc_application/features/login_page/UI/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Dashboard',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: LoginPage(),
    );
  }
}
