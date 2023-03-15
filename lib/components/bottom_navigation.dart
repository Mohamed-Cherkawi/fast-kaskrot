import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


class NavigationAppBar extends StatelessWidget {
  final int defaultSelectedIndex;

  const NavigationAppBar({super.key ,required this.defaultSelectedIndex});

  @override
  Widget build(BuildContext context) {
    return  GNav(
      backgroundColor: Colors.black,
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      tabBorderRadius: 2,
      selectedIndex: defaultSelectedIndex,
      gap: 20,
      activeColor: Colors.white,
      tabs: [
         GButton(
          icon: Icons.restaurant,
          text: 'Restaurants',
          onPressed: (){
            Navigator.pushNamed(context, '/');
          },
        ),
        GButton(
          icon: Icons.shopping_cart_outlined,
          text: 'Cart',
          onPressed: () {
            Navigator.pushNamed(context, 'cart');
          },
        ),
        const GButton(
          icon: Icons.history_sharp,
          text: 'History',
        ),
      ],
    );
  }
}