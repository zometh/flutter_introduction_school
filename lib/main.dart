import 'package:flutter/material.dart';
import 'package:introduction/common/theme.dart';
import 'package:introduction/routes/routes.dart';
import 'package:introduction/views/home.dart';
import 'package:introduction/views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double opacity = 1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      theme: ligThemeData(context),
      darkTheme: darkemeData(context),
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: {
        NavigationRoutes.home : (BuildContext context) => const Home()
      },
    );
  }
}
