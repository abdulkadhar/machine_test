import 'package:flutter/material.dart';
import 'package:machine_test/model/user_model.dart';
import 'package:machine_test/screens/otp_screen.dart';
import 'package:machine_test/screens/user_home_screen.dart';
import 'package:machine_test/services/login_service.dart';
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
          const Spacer(),
          Center(
            child: Image.asset(
              'assets/images/login_logo.png',
              height: 200,
              width: 200,
            ),
          ),
          const Spacer(),
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
            onPress: () async {
              try {
                final userCredential = await LoginService.signInWithGoogle();
                final uid = userCredential.user?.uid;
                if (uid != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserHomeScreen(
                        model: UserModel(
                          uid: uid,
                          userName: userCredential.user?.displayName,
                          phoneNumber: userCredential.user?.phoneNumber,
                          type: AuthType.google,
                        ),
                      ),
                    ),
                  );
                }
              } catch (e) {
                return;
              }
            },
          ),
          const SizedBox(height: 10),
          AuthButton(
            buttonColor: Colors.green,
            icon: const Icon(
              Icons.phone,
              size: 30,
              color: Colors.white,
            ),
            label: 'Phone',
            onPress: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const OtpScreen(),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
