import 'package:flutter/material.dart';

import '../components/bottom_navigation.dart';
import '../components/restaurant/restaurant_info_section.dart';


class RestaurantWidget extends StatelessWidget {
  const RestaurantWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RestaurantInfo(imageName: 'le_tacos_de_lyon.jpg',),
      bottomNavigationBar: NavigationAppBar(),
    );
  }

}