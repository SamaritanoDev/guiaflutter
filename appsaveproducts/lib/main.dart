import 'package:appsaveproducts/const/mycolors.dart';
import 'package:appsaveproducts/screens/screens.dart';
import 'package:appsaveproducts/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/login_form_provider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductsService()),
        ChangeNotifierProvider(create: (_) => LoginFormProvider()),
      ],
      child: const MyApp(),
    );
  }
}

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
