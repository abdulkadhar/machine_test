// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addon_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddonResponse _$AddonResponseFromJson(Map<String, dynamic> json) {
  return AddonResponse(
    dishId: json['dish_id'] as String,
    dishName: json['dish_name'] as String,
    dishPrice: json['dish_price'] as int,
    dishImage: json['dish_image'] as String,
    dishCurrency: json['dish_currency'] as String,
    dishCalories: json['dish_calories'] as int,
    dishDescription: json['dish_description'] as int,
    dishType: json['dish_Type'] as bool,
  );
}

Map<String, dynamic> _$AddonResponseToJson(AddonResponse instance) =>
    <String, dynamic>{
      'dish_id': instance.dishId,
      'dish_name': instance.dishName,
      'dish_price': instance.dishPrice,
      'dish_image': instance.dishImage,
      'dish_currency': instance.dishCurrency,
      'dish_calories': instance.dishCalories,
      'dish_description': instance.dishDescription,
      'dish_Type': instance.dishType,
    };
