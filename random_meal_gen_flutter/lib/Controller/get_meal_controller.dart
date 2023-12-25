import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:random_meal_gen/Models/api_response.dart';

class Controller {
  Future<ApiResponse> getRandomMeal() async {
    try {
      var endpoint = 'https://www.themealdb.com/api/json/v1/1/random.php';
      var response = await http.get(Uri.parse(endpoint));

      return ApiResponse.fromMap(jsonDecode(response.body)["meals"][0]);
    } on Exception {
      rethrow;
    }
  }
}
