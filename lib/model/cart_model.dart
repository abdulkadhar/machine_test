import 'package:http/http.dart';
import 'package:machine_test/model/dish_response.dart';

class CartModel {
  final DishResponse dishData;
  final int count;
  CartModel({
    required this.dishData,
    required this.count,
  });
}
