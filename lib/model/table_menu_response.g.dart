// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_menu_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TableMenuResponse _$TableMenuResponseFromJson(Map<String, dynamic> json) {
  return TableMenuResponse(
    menuCategory: json['menu_category'] as String,
    menuCategoryId: json['menu_category_id'] as String,
    menuCategoryImage: json['menu_category_image'] as String,
    nexturl: json['nexturl'] as String,
    addonCat: (json['addonCat'] as List<dynamic>?)
        ?.map((e) => AddonCategoryResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$TableMenuResponseToJson(TableMenuResponse instance) =>
    <String, dynamic>{
      'menu_category': instance.menuCategory,
      'menu_category_id': instance.menuCategoryId,
      'menu_category_image': instance.menuCategoryImage,
      'nexturl': instance.nexturl,
      'addonCat': instance.addonCat,
    };
