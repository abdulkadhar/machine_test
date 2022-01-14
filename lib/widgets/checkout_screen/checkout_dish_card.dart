import 'package:flutter/material.dart';
import 'package:machine_test/model/cart_model.dart';
import 'package:machine_test/services/restaurant_service.dart';
import 'package:machine_test/widgets/user-home-screen/food_grade_symbol.dart';

class CheckoutDishCard extends StatelessWidget {
  final CartModel data;
  const CheckoutDishCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 15.0,
        horizontal: 10,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: FoodGrade(foodType: data.dishData.dishType),
          ),
          const SizedBox(width: 5),
          SizedBox(
            width: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.dishData.dishName,
                  style: const TextStyle(
                    color: Color(0xFF626365),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'INR ' +
                      RestaurantService.convertSarToInr(data.dishData.dishPrice)
                          .toStringAsFixed(2),
                  style: const TextStyle(
                    color: Color(0xFF626365),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  data.dishData.dishCalories.toStringAsFixed(0) + ' calories',
                  style: const TextStyle(
                    color: Color(0xFF626365),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Material(
            borderRadius: BorderRadius.circular(40),
            elevation: 3,
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: const Color(0xFF1A3E15),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(width: 15),
                  InkWell(
                    onTap: () {},
                    child: const Text(
                      "-",
                      style: TextStyle(
                        fontSize: 46,
                        height: 0.8,
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Text(
                    data.count.toString(),
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 15),
                  InkWell(
                    onTap: () {},
                    child: const Text(
                      "+",
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                ],
              ),
            ),
          ),
          const Spacer(),
          Text(
            'INR ' +
                RestaurantService.convertSarToInr(
                        data.dishData.dishPrice * data.count)
                    .toStringAsFixed(2),
            style: const TextStyle(
              color: Color(0xFF626365),
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          )
        ],
      ),
    );
  }
}
