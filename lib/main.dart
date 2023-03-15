import 'package:fast_kaskrot/config/sql_db_config.dart';
import 'package:fast_kaskrot/models/restaurant.dart';
import 'package:fast_kaskrot/pages/home_page.dart';
import 'package:fast_kaskrot/pages/restaurant_info_page.dart';
import 'package:fast_kaskrot/service/meal_service.dart';
import 'package:fast_kaskrot/service/restaurant_service.dart';
import 'package:fast_kaskrot/util/AppColor.dart';
import 'package:flutter/material.dart';

void main() async {
  RestaurantService restoService = RestaurantService();
  MealService mealService = MealService();

  final response = await restoService.restaurants();
  debugPrint(response.toString());
  final response2 = await mealService.meals();
  debugPrint(response2.toString());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: AppColor.scaffoldBackColor
      ),
      routes: {
        '/' : (context) => const HomePage(),
        'restaurant-info' : (context) =>  RestaurantWidget(restaurantId: ModalRoute.of(context)!.settings.arguments as int),
        // 'restaurant-menu' : (context) => const HomePage(),
        // 'cart' : (context) => const RegisterWidget(),
        // 'orders-history' : (context) => const
        //'profile' : (context) => Scaffold(),
        //'transaction' : (context) => Transaction()
        },
    );
  }
}