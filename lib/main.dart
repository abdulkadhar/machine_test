import 'package:flutter/material.dart';
import 'package:machine_test/screens/login_screen.dart';

void main() {
  runApp(const MachineTestApp());
}

class MachineTestApp extends StatelessWidget {
  const MachineTestApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Login Screen',
      home: LoginScreen(),
    );
  }
}
