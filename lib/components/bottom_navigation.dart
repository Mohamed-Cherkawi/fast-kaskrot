import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


class NavigationAppBar extends StatelessWidget {
  const NavigationAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  const GNav(
      color: Colors.black,
      padding: EdgeInsets.all(20),
      tabBorderRadius: 2,
      selectedIndex: 0,
      gap: 8,
      tabs: [
        GButton(
          icon: Icons.home,
          text: 'Home',
        ),
        GButton(
          icon: Icons.supervised_user_circle_outlined,
          text: 'Contacts',
        ),
        GButton(
          icon: Icons.wallet,
          text: 'Wallet',
        ),
        GButton(
          icon: Icons.settings,
          text: 'Settings',
        ),
      ],
    );
  }
}