import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() {
  runApp(const TodaySession());
}

class TodaySession extends StatelessWidget {
  const TodaySession({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LaunchScreen(),
    );
  }
}

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  int result = 0;

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          'Sign In',
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                  controller: emailController,
                  decoration: getTextFieldDecoration('Email here')),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: passwordController,
                decoration: getTextFieldDecoration('Password here'),
              ),
              const SizedBox(
                height: 50,
              ),
              CupertinoButton(
                color: Colors.grey,
                child: const Text('Sign in'),
                onPressed: () => validateUser(
                  emailController.text,
                  passwordController.text,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  validateUser(String email, String password) {
    Credential.userList.forEach((element) {
      if (element.email.trim() == email) {
        if (element.password.trim() == password) {
          log('your user: ${element.userName}');
        } else {
          log('incorrect password');
        }
      } else {
        log('email does not exist');
      }
    });
  }

  getTextFieldDecoration(String hintText) {
    var borderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Colors.amber,
        width: 2,
      ),
    );
    return InputDecoration(
      hintText: hintText,
      border: borderStyle,
      enabledBorder: borderStyle,
      focusedBorder: borderStyle,
    );
  }
}

abstract class Credential {
  static List<UserModel> userList = [
    UserModel(email: 'abc@abc.com', password: 'abc123', userName: 'User ABC'),
  ];
}

class UserModel {
  final String email;
  final String password;
  final String userName;

  UserModel(
      {required this.email, required this.password, required this.userName});
}
