import 'package:fast_kaskrot/components/app_bar.dart';
import 'package:fast_kaskrot/components/bottom_navigation.dart';
import 'package:fast_kaskrot/components/home/restaurant_section.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children:  [
            Container(
                height: 60,
                color: Colors.black,
                child:  AppBarWidget(barName: 'Home')
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
              child: const Text(
                  'Nearby Restaurants' ,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      letterSpacing: 1
                  )
              )
            ),
            const RestaurantSection()
        ],
      ),
      bottomNavigationBar: const NavigationAppBar()
    );
  }
}