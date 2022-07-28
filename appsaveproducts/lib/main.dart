import 'package:appsaveproducts/screens/screens.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'login': (context) => const LoginScreen(),
        'home': (context) => const HomeScreen(),
      },
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[300],
        appBarTheme:
            const AppBarTheme(elevation: 0, color: Colors.deepPurpleAccent),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.deepPurpleAccent, elevation: 0),
      ),
    );
  }
}
