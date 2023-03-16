import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:fast_kaskrot/components/app_bar.dart';
import 'package:fast_kaskrot/components/bottom_navigation.dart';
import 'package:fast_kaskrot/components/cart/cart_item.dart';
import 'package:fast_kaskrot/models/meal.dart';
import 'package:fast_kaskrot/service/meal_service.dart';
import 'package:fast_kaskrot/service/order_service.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
   const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double totalMealsPrice = 0;
  Map<int,double> mealsPrices = {};
  bool isButtonHidden = true;
  OrderService orderService = OrderService();
  MealService mealService = MealService();

  void refreshPageState() {
    setState(() {
      print('refresh called');
      mealsPrices.clear();
    });
  }
  void updatePriceById(int id , double newPrice){
      mealsPrices[id] = newPrice;
      print(mealsPrices);
  }
  void getCartMeals() async{
   List<Meal> fetchedMeals = await mealService.getAllCartMeal();
   if(fetchedMeals.isNotEmpty){
      showButton();
   }
  }
  void hideButton() {
      setState(() {
        isButtonHidden = true;
      });
  }
  void showButton(){
    setState(() {
      isButtonHidden = false;
    });
  }
  @override
  void initState() {
    super.initState();
    getCartMeals();
  }

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
                      future: mealService.getAllCartMeal(),
                      builder: ( context ,  snapshot ) {
                          if(snapshot.hasData){
                            if(snapshot.data!.isEmpty){
                              return const Text(
                                "No Items Added To Cart !" ,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold ,
                                    letterSpacing: 1
                                )
                              );
                            }
                            for (Meal meal in snapshot.data!) {
                             mealsPrices[meal.id] = meal.price;
                            }
                            print(mealsPrices);
                            return Column(
                              children: [
                                for(Meal meal in snapshot.data!)
                                  CartItem(meal: meal , refreshParentHolderState: refreshPageState , updatePriceById: updatePriceById),
                              ],
                            );
                          }else if(snapshot.hasError){
                            return const Text("Something went wrong while fetching data");
                          }
                          return const CircularProgressIndicator();
                      }
                  ),
                  const SizedBox(height: 20),
                  if(! isButtonHidden)
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(370, 60),
                        backgroundColor: Colors.black,
                        elevation: 0,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50))
                        )
                      ),
                      onPressed: () async{
                        mealsPrices.values.forEach((price) {
                            totalMealsPrice += price;
                        });
                        debugPrint(totalMealsPrice.toString());

                        await orderService.createOrder(totalMealsPrice);

                        totalMealsPrice = 0;

                        hideButton();
                        triggerNotification();
                      },
                      child: const Text(
                        'Order Now' ,
                        style: TextStyle(
                            fontWeight: FontWeight.bold ,
                            letterSpacing: 4
                        )
                      )
                  )
                ],
              )
          ),
          const SizedBox(height: 20),
        ],
      ),
      bottomNavigationBar: const NavigationAppBar(defaultSelectedIndex: 1),
    );
  }
  void triggerNotification(){
    AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 50,
            channelKey: 'chanelKey',
            title: 'New Order',
            body: 'Your order has been successfully placed'
        )
    );
  }
}