import 'package:fast_kaskrot/components/app_bar.dart';
import 'package:fast_kaskrot/components/restaurant_section.dart';
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
                child: const AppBarWidget(barName: 'Home')
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
          Column(
            children: const [
              RestaurantSection(),
            ],
          )
        ],
      ),
    );
  }
}