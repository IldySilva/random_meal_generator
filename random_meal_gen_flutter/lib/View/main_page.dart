import 'package:flutter/material.dart';
import 'package:random_meal_gen/View/meal_details_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
              child: Column(
            children: [
              Text(
                "Feeling Hungry?",
                style: TextStyle(fontSize: 43),
              ),
              SizedBox(
                height: 5,
              ),
              Text("Get a Random meal by clicking the Button Below")
            ],
          )),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context, PageRouteBuilder(
                    pageBuilder: (ctx, animation, secondAnimation) {

                  return FadeTransition(
                    opacity: animation,
                    child: MealDetail(),
                  );
                }));
              },
              child: const Text("Get Meal"))
        ],
      ),
    ));
  }
}
