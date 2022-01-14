import 'package:flutter/material.dart';

class FoodGrade extends StatelessWidget {
  final int foodType;
  const FoodGrade({
    Key? key,
    required this.foodType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1),
      height: 15,
      width: 15,
      decoration: BoxDecoration(
        border: Border.all(
          color: foodType == 2 ? Colors.green : Colors.red,
        ),
      ),
      child: CircleAvatar(
        radius: 5,
        backgroundColor: foodType == 2 ? Colors.green : Colors.red,
      ),
    );
  }
}
