import 'package:json_annotation/json_annotation.dart';
import 'package:machine_test/model/table_menu_response.dart';

part 'restaurant_response.g.dart';

@JsonSerializable()
class RestaurantResponse {
  @JsonKey(name: 'restaurant_id')
  final String restaurantId;

  @JsonKey(name: 'restaurant_name')
  final String restaurantName;

  @JsonKey(name: 'table_id')
  final String tableId;

  @JsonKey(name: 'table_name')
  final String tableName;

  @JsonKey(name: 'branch_name')
  final String branchName;

  @JsonKey(name: 'nexturl')
  final String nexturl;

  @JsonKey(name: 'table_menu_list')
  final List<TableMenuResponse> tableMenuList;

  RestaurantResponse({
    required this.restaurantId,
    required this.branchName,
    required this.nexturl,
    required this.restaurantName,
    required this.tableId,
    required this.tableName,
    required this.tableMenuList,
  });
  factory RestaurantResponse.fromJson(Map<String, dynamic> json) =>
      _$RestaurantResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantResponseToJson(this);
}
