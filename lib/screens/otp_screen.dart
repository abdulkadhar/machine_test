import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:machine_test/model/user_model.dart';
import 'package:machine_test/screens/user_home_screen.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  GlobalKey<FormState> mobileForm = GlobalKey<FormState>();
  TextEditingController otpController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();

  String phoneVerificationId = "";

  void _handleSubmit() {
    FormState? _currentFormState = mobileForm.currentState;
    if (_currentFormState != null && _currentFormState.validate()) {
      _handlePhoneNumberVerification(mobileNumberController.text);
    }
  }

  void _handleOtp() async {
    if (otpController.text.length == 6) {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: phoneVerificationId,
        smsCode: otpController.text,
      );
      try {
        final response = await auth.signInWithCredential(credential);
        final uid = response.user?.uid;
        if (uid != null) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => UserHomeScreen(
                  model: UserModel(
                    uid: uid,
                    userName: response.user?.displayName,
                    phoneNumber: response.user?.phoneNumber,
                    type: AuthType.phoneNumber,
                  ),
                ),
              ),
              (route) => false);
        }
      } catch (e) {
        return;
      }
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Please enter a valid 6- digit otp"),
      ),
    );
  }

  void _handlePhoneNumberVerification(String mobileNumber) async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91 ' + mobileNumber,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) async {
          final userCredential = await auth.signInWithCredential(credential);
          final uid = userCredential.user?.uid;
          if (uid != null) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => UserHomeScreen(
                  model: UserModel(
                    uid: uid,
                    userName: userCredential.user?.displayName,
                    phoneNumber: userCredential.user?.phoneNumber,
                    type: AuthType.phoneNumber,
                  ),
                ),
              ),
              (route) => false,
            );
          }
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(e.message ?? "Something went worng"),
              ),
            );
          }
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "Something went worng, please try again later",
              ),
            ),
          );
        },
        codeSent: (String verificationId, int? resendToken) async {
          print('verification ID: $verificationId');
          setState(() {
            phoneVerificationId = verificationId;
          });
          // String smsCode = 'xxxx';
          // Create a PhoneAuthCredential with the code
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Something went worng, please try again later",
          ),
        ),
      );
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
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
            const SizedBox(height: 10),
            if (phoneVerificationId.isEmpty)
              Form(
                key: mobileForm,
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.number,
                      validator: (mobileNum) {
                        if (mobileNum == null || mobileNum.isEmpty) {
                          return 'please enter Mobile Number';
                        }

                        if (mobileNum.length < 10) {
                          return 'Enter a valid mobile number';
                        }
                      },
                      controller: mobileNumberController,
                      maxLength: 10,
                      cursorColor: Colors.green,
                      decoration: InputDecoration(
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.green,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            if (phoneVerificationId.isNotEmpty)
              TextFormField(
                controller: otpController,
                cursorColor: Colors.green,
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                maxLength: 6,
                keyboardType: TextInputType.number,
                onChanged: (otp) {
                  if (otp.length == 6) {
                    _handleOtp();
                  }
                },
              ),
            ElevatedButton(
                onPressed:
                    phoneVerificationId.isEmpty ? _handleSubmit : _handleOtp,
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text("Submit",
                    style: TextStyle(color: Colors.white))),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
