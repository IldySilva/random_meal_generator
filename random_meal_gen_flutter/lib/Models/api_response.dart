
import 'package:random_meal_gen/Models/meal.dart';

class ApiResponse {
  Meals meals;

  ApiResponse({required this.meals});


  factory ApiResponse.fromMap(Map<String, dynamic> map) {
    return ApiResponse(
      meals: Meals.fromJson(map)
    );
  }
}
