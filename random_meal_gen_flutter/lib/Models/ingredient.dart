class Ingredient {
  final String name;
  final String measure;

  Ingredient(this.name, this.measure);
}

class MealIngredients {
  final List<Ingredient> ingredients;

  MealIngredients(this.ingredients);
}


MealIngredients extractIngredients(Map<String, dynamic> mealData) {
  List<Ingredient> ingredients = [];

  for (int i = 1; i <= 20; i++) {
    String ingredientKey = 'strIngredient$i';
    String measureKey = 'strMeasure$i';

    if (mealData[ingredientKey] != null &&
        mealData[ingredientKey].trim().isNotEmpty &&
        mealData[measureKey] != null &&
        mealData[measureKey].trim().isNotEmpty) {
      String ingredient = mealData[ingredientKey];
      String measure = mealData[measureKey];
      ingredients.add(Ingredient(ingredient, measure));
    }
  }

  return MealIngredients(ingredients);
}
