import 'package:firebase_core/firebase_core.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'Login Screen',
      home: Initializer(),
    );
  }
}

class Initializer extends StatelessWidget {
  const Initializer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          // Check for errors
          if (snapshot.hasError) {
            return Expanded(
              child: Container(
                color: Colors.white,
                child: Column(
                  children: const [
                    Icon(Icons.info, color: Colors.blue),
                    Text(
                      "Something went wrong please restart the application",
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    )
                  ],
                ),
              ),
            );
          }

          // Once complete, show your application
          if (snapshot.connectionState == ConnectionState.done) {
            return const LoginScreen();
          }

          // Otherwise, show something whilst waiting for initialization to complete
          return const CircularProgressIndicator();
        });
  }
}
