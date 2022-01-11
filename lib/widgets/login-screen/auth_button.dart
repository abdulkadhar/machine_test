import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final Color buttonColor;
  final VoidCallback onPress;
  final Widget icon;
  final String label;
  const AuthButton({
    Key? key,
    required this.buttonColor,
    required this.onPress,
    required this.icon,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: buttonColor,
          padding: const EdgeInsets.symmetric(
            vertical: 15,
          ),
        ),
        onPressed: onPress,
        child: Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            icon,
            const Spacer(),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            const Spacer(),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
      ),
    );
  }
}
