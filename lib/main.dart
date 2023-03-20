import 'package:flutter/material.dart';
import 'package:login_ui/Themes/my_themes.dart';

import 'Screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

Color color1 = const Color.fromARGB(255, 204, 235, 241);
Color color2 = const Color(0xff01b7de);
Color color3 = const Color(0xfff9f9f9);
Color color4 = const Color(0xff172025);
Color color5 = const Color(0xffa7a8ad);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      home: const IntroScreen(),
    );
  }
}
