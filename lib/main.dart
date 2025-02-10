import 'package:flutter/material.dart';
import 'package:flutter_bloc_application/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: RouteConstants.loginScreen,
      onGenerateRoute: RouteGenerator.generateRoute,
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(child: Text('Routes not found: ${settings.name}')),
        ),
      ),
    );
  }
}
