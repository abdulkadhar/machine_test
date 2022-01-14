// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dish_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DishResponse _$DishResponseFromJson(Map<String, dynamic> json) {
  return DishResponse(
    dishAvailability: json['dish_Availability'] as bool,
    dishCalories: (json['dish_calories'] as num).toDouble(),
    dishCurrency: json['dish_currency'] as String,
    dishDescription: json['dish_description'] as String,
    dishId: json['dish_id'] as String,
    dishImage: json['dish_image'] as String,
    dishName: json['dish_name'] as String,
    dishPrice: (json['dish_price'] as num).toDouble(),
    dishType: json['dish_Type'] as int,
    nexturl: json['nexturl'] as String,
    addonCat: (json['addonCat'] as List<dynamic>)
        .map((e) => AddonCategoryResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$DishResponseToJson(DishResponse instance) =>
    <String, dynamic>{
      'dish_id': instance.dishId,
      'dish_name': instance.dishName,
      'dish_price': instance.dishPrice,
      'dish_image': instance.dishImage,
      'dish_currency': instance.dishCurrency,
      'dish_calories': instance.dishCalories,
      'dish_description': instance.dishDescription,
      'dish_Availability': instance.dishAvailability,
      'dish_Type': instance.dishType,
      'nexturl': instance.nexturl,
      'addonCat': instance.addonCat,
    };
