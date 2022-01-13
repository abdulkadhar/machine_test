import 'package:machine_test/model/restaurant_response.dart';
import 'package:machine_test/services.dart/api.dart';

class RestaurantService {
  static Future<List<RestaurantResponse>> getRestaurantData() async {
    final jsonData = await ApiService.getData('/v2/5dfccffc310000efc8d2c1ad');
    return (jsonData as List)
        .map((e) => RestaurantResponse.fromJson(e))
        .toList();
  }

  static double convertSarToInr(double dishPrice) {
    return dishPrice * 19.69;
  }
}
