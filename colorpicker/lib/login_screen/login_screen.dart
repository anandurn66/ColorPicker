// ignore_for_file: prefer_const_constructors, await_only_futures, avoid_print

import 'package:colorpicker/home_screen/home_screen.dart';
import 'package:colorpicker/registration_screen/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var height10 = SizedBox(
      height: 10,
    );
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Login'),
          height10,
          TextFormField(
            controller: nameController,
            decoration: const InputDecoration(hintText: 'Username'),
          ),
          height10,
          TextFormField(
            controller: passController,
            decoration: const InputDecoration(hintText: 'Password'),
          ),
          height10,
          ElevatedButton(
            onPressed: () async {
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              String regName = await prefs.get("name").toString();
              String regPass = await prefs.get("pass").toString();
              print(regName);
              print(regPass);

              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ));
            },
            child: Text("Login"),
          ),
          height10,
          Text("Don't have an account,Register now"),
        ],
      ),
    );
  }
}
