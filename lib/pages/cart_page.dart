import 'package:fast_kaskrot/components/app_bar.dart';
import 'package:fast_kaskrot/components/bottom_navigation.dart';
import 'package:fast_kaskrot/components/cart/cart_item.dart';
import 'package:fast_kaskrot/models/meal.dart';
import 'package:fast_kaskrot/service/meal_service.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  List<Meal> meals = [];
   CartPage({super.key});

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
                  FutureBuilder(
                      future: MealService().getAllCartMeal(),
                      builder: ( context ,  snapshot) {
                          if(snapshot.hasData){
                            if(snapshot.data!.isEmpty){
                              return const Text("No Items added to cart");
                            }
                            return Column(
                              children: [
                                for(Meal meal in snapshot.data!)
                                  CartItem(meal: meal),
                              ],
                            );
                          }else if(snapshot.hasError){
                            return const Text("Something went wrong while fetching data");
                          }
                          return const CircularProgressIndicator();
                      }
                  ),
                ],
              )
          ),
          const SizedBox(height: 20),
        ],
      ),
      bottomNavigationBar: const NavigationAppBar(defaultSelectedIndex: 1),
    );
  }

}