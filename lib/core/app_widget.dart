import 'package:counter_people/views/home_page/home_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculadora de IMC",
      // home: ChallengePage(),
      home: HomePage(),
      // home: SplashPage(),
    );
  }
}
