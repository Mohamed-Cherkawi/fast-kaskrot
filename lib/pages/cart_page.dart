import 'package:fast_kaskrot/components/app_bar.dart';
import 'package:fast_kaskrot/components/bottom_navigation.dart';
import 'package:fast_kaskrot/components/cart/cart_item.dart';
import 'package:fast_kaskrot/models/meal.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          AppBarWidget(
              barName: 'My Cart' ,
              leadingIcon: Icons.arrow_back_outlined
           ),
          const SizedBox(height: 20),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  CartItem(meal: Meal(id: 1, imageName: 'imageName', title: 'title', availability: 'availability', description: 'description', price: 2, restaurantId: 1),),
                ],
              )
          )
        ],
      ),
      bottomNavigationBar: const NavigationAppBar(defaultSelectedIndex: 1),
    );
  }
}