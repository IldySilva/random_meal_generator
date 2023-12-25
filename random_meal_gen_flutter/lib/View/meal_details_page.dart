import 'package:flutter/material.dart';
import 'package:random_meal_gen/Controller/get_meal_controller.dart';
import 'package:random_meal_gen/Models/meal.dart';

import '../Models/ingredient.dart';

class MealDetail extends StatefulWidget {
  MealDetail({super.key});

  @override
  State<MealDetail> createState() => _MealDetailState();
}

class _MealDetailState extends State<MealDetail> {
  Controller controller = Controller();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
            future: controller.getRandomMeal(),
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }

              Meals? meal = snapshot.data?.meals;
              MealIngredients mealIngredients =
                  extractIngredients(meal!.toJson());
              return NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
pinned: true,
expandedHeight: 100,
                        flexibleSpace: FlexibleSpaceBar(
                          centerTitle: true,
                          title:  Text(
                          meal.strMeal ?? "Titulo Indefinido",
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold,color: Colors.black),
                        ),),
                        )
                  ];
                },
                body: SingleChildScrollView(
                  child: Column(
                    children: [

                      Text(
                        "${meal.strArea!} |  ${meal.strCategory!}",
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CircleAvatar(
                        radius: 100,
                        backgroundImage: NetworkImage(meal.strMealThumb!),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Ingredientes:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      Center(
                        child: Wrap(
                          children: [
                            for (Ingredient ingredient
                                in mealIngredients.ingredients)
                              SizedBox(
                                width: 150,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.blue.shade50,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Center(
                                              child: Text(
                                            ingredient.name,
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                          )),
                                        ),
                                        Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(100)),
                                            child: Center(
                                                child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                ingredient.measure,
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Steps:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          meal.strInstructions!,
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
