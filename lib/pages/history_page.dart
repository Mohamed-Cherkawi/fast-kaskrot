import 'package:fast_kaskrot/components/history/order_section.dart';
import 'package:fast_kaskrot/models/order.dart';
import 'package:fast_kaskrot/service/order_service.dart';
import 'package:flutter/material.dart';

import '../components/app_bar.dart';
import '../components/bottom_navigation.dart';

class HistoryPage extends StatelessWidget {
  OrderService orderService = OrderService();
  HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
            children: [
              AppBarWidget(
                  barName: 'My Orders' ,
                  leadingIcon: Icons.arrow_back_outlined
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                      FutureBuilder(
                          future: orderService.orders(),
                          builder: (context , snapshot){
                              if(snapshot.hasData){
                                  if(snapshot.data!.isEmpty){
                                      return const Text(
                                        'You Haven\'t Any Order Yet !',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold ,
                                          letterSpacing: 1
                                      ),
                                      );
                                  }
                                  return Column(
                                    children: [
                                        for(Order order in snapshot.data!)
                                          OrderSection(order: order),
                                    ],
                                  );

                              } else if(snapshot.hasError){
                                return const Text("Something went wrong while fetching data");
                              }
                              return const CircularProgressIndicator();
                          }),
                    const SizedBox(height: 20),
                  ],
                ),
              )
            ],
        ),
      bottomNavigationBar: const NavigationAppBar(defaultSelectedIndex: 2),
    );
  }

}