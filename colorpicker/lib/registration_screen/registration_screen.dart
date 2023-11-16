// ignore_for_file: use_build_context_synchronously

import 'package:colorpicker/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var height10 = const SizedBox(
      height: 10,
    );
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Register'),
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
              if (nameController.text.trim().isNotEmpty &&
                  passController.text.trim().isNotEmpty) {
                await prefs.setString("name", nameController.text.trim());
                await prefs.setString("pass", passController.text.trim());
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.amber,
                    content: Text("Enter a vaild email and pass")));
              }
            },
            child: const Text("Register"),
          ),
          height10,
          InkWell(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              },
              child: const Text("Already have an account, Login now")),
        ],
      ),
    );
  }
}
