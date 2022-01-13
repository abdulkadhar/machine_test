import 'package:json_annotation/json_annotation.dart';

part 'dish_response.g.dart';

@JsonSerializable()
class DishResponse {
  @JsonKey(name: 'dish_id')
  final String dishId;

  @JsonKey(name: 'dish_name')
  final String dishName;

  @JsonKey(name: 'dish_price')
  final double dishPrice;

  @JsonKey(name: 'dish_image')
  final String dishImage;

  @JsonKey(name: 'dish_currency')
  final String dishCurrency;

  @JsonKey(name: 'dish_calories')
  final int dishCalories;

  @JsonKey(name: 'dish_description')
  final String dishDescription;

  @JsonKey(name: 'dish_Availability')
  final bool dishAvailability;

  @JsonKey(name: 'dish_Type')
  final int dishType;

  @JsonKey(name: 'nexturl')
  final String nexturl;

  DishResponse({
    required this.dishAvailability,
    required this.dishCalories,
    required this.dishCurrency,
    required this.dishDescription,
    required this.dishId,
    required this.dishImage,
    required this.dishName,
    required this.dishPrice,
    required this.dishType,
    required this.nexturl,
  });

  factory DishResponse.fromJson(Map<String, dynamic> json) =>
      _$DishResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DishResponseToJson(this);
}
