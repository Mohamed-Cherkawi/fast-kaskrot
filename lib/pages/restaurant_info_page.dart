import 'package:fast_kaskrot/components/bottom_navigation.dart';
import 'package:fast_kaskrot/components/restaurant/restaurant_image_section.dart';
import 'package:flutter/material.dart';

import '../components/app_bar.dart';

class RestaurantInfo extends StatelessWidget {
  const RestaurantInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children:  [
          Container(
              height: 60,
              color: Colors.black,
              child:  AppBarWidget(leadingIcon: Icons.arrow_back_outlined,barName: 'Restaurant')
          ),
          const RestaurantImage(imageName: 'le_tacos_de_lyon.jpg'),
        ],
      ),
      bottomNavigationBar: const NavigationAppBar(),
    );
  }

}