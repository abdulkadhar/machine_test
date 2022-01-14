import 'package:json_annotation/json_annotation.dart';
import 'package:machine_test/model/addon_response.dart';

part 'addon_category_response.g.dart';

@JsonSerializable()
class AddonCategoryResponse {
  @JsonKey(name: 'addon_category')
  final String addonCategory;

  @JsonKey(name: 'addon_category_id')
  final String addonCategoryId;

  @JsonKey(name: 'addon_selection')
  final int addonSelection;

  @JsonKey(name: 'nexturl')
  final String nexturl;

  @JsonKey(name: 'addons')
  final List<AddonResponse> addons;

  AddonCategoryResponse({
    required this.addonCategory,
    required this.addonCategoryId,
    required this.addonSelection,
    required this.nexturl,
    required this.addons,
  });

  factory AddonCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$AddonCategoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddonCategoryResponseToJson(this);
}
