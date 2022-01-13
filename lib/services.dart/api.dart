import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

enum ApiExceptionType { offline, badResponse }

class ApiException implements Exception {
  final String message;
  final ApiExceptionType type;

  ApiException(this.type, this.message);

  @override
  String toString() {
    return message;
  }
}

class ApiService {
  static String baseUrl = 'www.mocky.io';
  static Future getData(String url,
      {Map<String, String> queryParams = const {}}) async {
    try {
      http.Response response =
          await http.get(Uri.https(baseUrl, url, queryParams));
      if (response.statusCode == 200) {
        final resBody = jsonDecode(response.body);
        return resBody;
      } else {
        final resBody = jsonDecode(response.body);
        throw ApiException(
          ApiExceptionType.badResponse,
          resBody['error'],
        );
      }
    } on SocketException {
      throw ApiException(ApiExceptionType.offline, "You are offline");
    }
  }
}
