// ignore_for_file: prefer_const_constructors, annotate_overrides, must_call_super

import 'package:colorpicker/registration_screen/registration_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then(
      (value) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RegistrationScreen(),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("Splash Screen"),
      ),
    );
  }
}
