import 'package:fast_kaskrot/components/restaurant/menu_badges.dart';
import 'package:fast_kaskrot/models/restaurant.dart';
import 'package:fast_kaskrot/service/restaurant_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/meal.dart';
import '../../service/meal_service.dart';
import '../app_bar.dart';
import 'meal_widget.dart';

class RestaurantInfo extends StatefulWidget {
  int restaurantId;

  RestaurantInfo({super.key ,required this.restaurantId});

  @override
  State<RestaurantInfo> createState() => _RestaurantInfoState();
}

class _RestaurantInfoState extends State<RestaurantInfo> {

  final MealService mealService = MealService();
  final RestaurantService restaurantService = RestaurantService();

  @override
   Widget build(BuildContext context) {
    return FutureBuilder<List<Restaurant>>(
      future: restaurantService.getRestaurantsById(widget.restaurantId),
      builder: (context , snapshot) {
        if(snapshot.hasData) {
          final restaurant = snapshot.data!.first;
          return ListView(
              children: [
                AppBarWidget(
                    leadingIcon: Icons.arrow_back_outlined,
                    barName: 'Restaurant'
                ),
                SizedBox(
                  width: double.infinity,
                  child: Stack(
                      children: [
                        Image.asset(
                          'assets/images/${restaurant.imageName}',
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                            bottom: 10,
                            right: 80,
                            child: Container(
                              padding: const EdgeInsets.all(7),
                              decoration: const BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(12))
                              ),
                              child: InkWell(
                                onTap: () {},
                                child: const Icon(
                                    Icons.phone,
                                    color: Colors.white
                                ),
                              ),
                            )
                        ),
                        Positioned(
                            bottom: 10,
                            right: 20,
                            child: Container(
                              padding: const EdgeInsets.all(7),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(12))
                              ),
                              child: InkWell(
                                onTap: () {},
                                child: const Icon(
                                    Icons.directions,
                                    color: Colors.black
                                ),
                              ),
                            )
                        ),
                      ]
                  ),
                ),
                Container(
                  height: 130,
                  width: double.infinity,
                  //color: Colors.deepPurpleAccent,
                  padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        restaurant.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                            letterSpacing: 2
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(right: 5),
                                child: Icon(
                                  Icons.place_outlined,
                                  color: CupertinoColors.systemGrey,
                                ),
                              ),
                              Text(
                                restaurant.address,
                                style: const TextStyle(
                                    color: CupertinoColors.systemGrey,
                                    fontSize: 10,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(right: 5),
                                child: Icon(
                                    Icons.access_time_outlined,
                                    color: CupertinoColors.systemGrey
                                ),
                              ),
                              Text(
                                  '4:00 AM - 11:00 PM',
                                  style: TextStyle(
                                      color: CupertinoColors.systemGrey,
                                      fontSize: 10,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.bold
                                  )
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  height: 130,
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Our Menu",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                            letterSpacing: 2
                        ),
                      ),
                      SizedBox(
                          height: 40,
                          child: MenuBadges(mealTypes: [
                            'Appetizers',
                            'Breakfast',
                            'Lunch',
                            'Mains'
                          ])
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:   [
                      const Text(
                        "Meals",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                            letterSpacing: 2
                        ),
                      ),
                      const SizedBox(height: 15),
                      FutureBuilder(
                          future: mealService.getMealsByRestaurantId(widget.restaurantId),
                          builder: (context , snapshot){
                            if(snapshot.hasData){
                              final meals = snapshot.data!;
                              print(meals);
                                if(meals.isNotEmpty){
                                      return Column(
                                        children: [
                                          for(Meal meal in meals)
                                            MealWidget(meal: meal),
                                        ],
                                      );
                                } else {
                                  return const Text('No Meals Yet To Show  In The Restaurant');
                                }
                            } else if(snapshot.hasError){
                                return const Text('Something went wrong ');
                            }
                            return const CircularProgressIndicator();
                      })
                    ],
                  ),
                )
              ]
          );
        }else if(snapshot.hasError){
          return const Text('Something Went Wrong');
        }
        return const CircularProgressIndicator();
      }
    );
  }
}