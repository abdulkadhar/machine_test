import 'package:json_annotation/json_annotation.dart';
import 'package:machine_test/model/addon_category_response.dart';
import 'package:machine_test/model/dish_response.dart';

part 'table_menu_response.g.dart';

@JsonSerializable()
class TableMenuResponse {
  @JsonKey(name: 'menu_category')
  final String menuCategory;

  @JsonKey(name: 'menu_category_id')
  final String menuCategoryId;

  @JsonKey(name: 'menu_category_image')
  final String menuCategoryImage;

  @JsonKey(name: 'nexturl')
  final String nexturl;

  @JsonKey(name: 'category_dishes')
  final List<DishResponse> categoryDishes;

  TableMenuResponse({
    required this.menuCategory,
    required this.menuCategoryId,
    required this.menuCategoryImage,
    required this.nexturl,
    required this.categoryDishes,
  });
  factory TableMenuResponse.fromJson(Map<String, dynamic> json) =>
      _$TableMenuResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TableMenuResponseToJson(this);
}
