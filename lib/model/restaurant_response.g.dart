// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestaurantResponse _$RestaurantResponseFromJson(Map<String, dynamic> json) {
  return RestaurantResponse(
    restaurantId: json['restaurant_id'] as String,
    branchName: json['branch_name'] as String,
    nexturl: json['nexturl'] as String,
    restaurantName: json['restaurant_name'] as String,
    tableId: json['table_id'] as String,
    tableName: json['table_name'] as String,
    tableMenuList: (json['table_menu_list'] as List<dynamic>)
        .map((e) => TableMenuResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$RestaurantResponseToJson(RestaurantResponse instance) =>
    <String, dynamic>{
      'restaurant_id': instance.restaurantId,
      'restaurant_name': instance.restaurantName,
      'table_id': instance.tableId,
      'table_name': instance.tableName,
      'branch_name': instance.branchName,
      'nexturl': instance.nexturl,
      'table_menu_list': instance.tableMenuList,
    };
