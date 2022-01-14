import 'package:flutter/material.dart';
import 'package:machine_test/model/cart_model.dart';
import 'package:machine_test/model/dish_response.dart';
import 'package:machine_test/services/restaurant_service.dart';
import 'package:machine_test/widgets/user-home-screen/dish_counter.dart';
import 'package:machine_test/widgets/user-home-screen/food_grade_symbol.dart';

class DishCard extends StatelessWidget {
  final DishResponse dishData;
  final Function(CartModel) onDishAddition;
  const DishCard({
    Key? key,
    required this.dishData,
    required this.onDishAddition,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FoodGrade(
            foodType: dishData.dishType,
          ),
          const SizedBox(width: 5),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dishData.dishName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      RestaurantService.convertSarToInr(dishData.dishPrice)
                          .toStringAsFixed(2),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      dishData.dishCalories.toStringAsFixed(0) + ' calories',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  dishData.dishDescription,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 10),
                CartAddButton(
                  onValueChange: (value) {
                    onDishAddition(
                      CartModel(
                        dishData: dishData,
                        count: value,
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                if (dishData.addonCat.isNotEmpty)
                  const Text(
                    "Customization Available",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 5),
          Container(
            height: 80,
            width: 80,
            color: Colors.grey.withOpacity(0.5),
            child: Image.network(
              "https://thumbs.dreamstime.com/b/healthy-food-background-fruits-vegetables-cereal-nuts-superfood-dietary-balanced-vegetarian-eating-products-kitchen-143677456.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
