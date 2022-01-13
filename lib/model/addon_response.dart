import 'package:json_annotation/json_annotation.dart';

part 'addon_response.g.dart';

@JsonSerializable()
class AddonResponse {
  @JsonKey(name: 'dish_id')
  final String dishId;

  @JsonKey(name: 'dish_name')
  final String dishName;

  @JsonKey(name: 'dish_price')
  final int dishPrice;

  @JsonKey(name: 'dish_image')
  final String dishImage;

  @JsonKey(name: 'dish_currency')
  final String dishCurrency;

  @JsonKey(name: 'dish_calories')
  final int dishCalories;

  @JsonKey(name: 'dish_description')
  final int dishDescription;

  @JsonKey(name: 'dish_Type')
  final bool dishType;

  AddonResponse({
    required this.dishId,
    required this.dishName,
    required this.dishPrice,
    required this.dishImage,
    required this.dishCurrency,
    required this.dishCalories,
    required this.dishDescription,
    required this.dishType,
  });

  factory AddonResponse.fromJson(Map<String, dynamic> json) =>
      _$AddonResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddonResponseToJson(this);
}
