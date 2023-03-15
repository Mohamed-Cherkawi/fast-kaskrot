import 'package:flutter/material.dart';

import '../components/bottom_navigation.dart';
import '../components/restaurant/restaurant_info_section.dart';


class RestaurantWidget extends StatelessWidget {
  int restaurantId;

  RestaurantWidget({super.key , required this.restaurantId});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: RestaurantInfo(restaurantId: restaurantId),
      bottomNavigationBar:  NavigationAppBar(),
    );
  }

}