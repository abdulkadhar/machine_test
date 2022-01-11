import 'package:flutter/material.dart';
import 'package:machine_test/widgets/login-screen/auth_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Image.asset(
              'assets/images/login_logo.png',
              height: 300,
              width: 300,
            ),
          ),
          AuthButton(
            buttonColor: Colors.blue,
            icon: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.white,
              child: Image.asset(
                'assets/images/google_logo.png',
                height: 20,
                width: 20,
              ),
            ),
            label: 'Google',
            onPress: () {},
          ),
        ],
      ),
    );
  }
}
