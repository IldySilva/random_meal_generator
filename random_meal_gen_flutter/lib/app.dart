import 'package:flutter/material.dart';
import 'package:random_meal_gen/View/main_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(home: MainPage(),theme: ThemeData(useMaterial3: true),);
  }
}
