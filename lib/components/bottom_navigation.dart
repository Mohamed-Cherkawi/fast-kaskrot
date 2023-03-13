import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


class NavigationAppBar extends StatelessWidget {

   const NavigationAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  const GNav(
      backgroundColor: Colors.black,
      color: Colors.white,
      padding: EdgeInsets.all(20),
      tabBorderRadius: 2,
      selectedIndex: 0,
      gap: 20,
      activeColor: Colors.white,
      tabs: [
        GButton(
          icon: Icons.restaurant,
          text: 'Restaurants',
        ),
        GButton(
          icon: Icons.shopping_cart_outlined,
          text: 'Cart',
        ),
        GButton(
          icon: Icons.history_sharp,
          text: 'History',
        ),
      ],
    );
  }
}