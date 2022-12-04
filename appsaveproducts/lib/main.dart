import 'package:appsaveproducts/const/mycolors.dart';
import 'package:appsaveproducts/screens/screens.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  final Color colormorado = ColorsMyApp.primarycolor;
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'login',
      routes: {
        'login': (context) => const LoginScreen(),
        'home': (context) => const HomeScreen(),
        'product': (context) => const ProductScreen(),
      },
      theme: ThemeData.light().copyWith(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.grey[300],
        appBarTheme:
            const AppBarTheme(elevation: 0, color: ColorsMyApp.primarycolor),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: colormorado, elevation: 0),
      ),
    );
  }
}
