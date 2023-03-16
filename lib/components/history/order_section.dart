import 'package:flutter/material.dart';

import '../../models/order.dart';

class OrderSection extends StatelessWidget {
  final Order order ;


  const OrderSection({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minWidth: 500, // set your desired max width here
      ),
      height: 140,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Order Reference  :'),
              Text(order.id.toString(), style: const TextStyle(fontWeight: FontWeight.bold),)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Order Was Requested At : '),
              Text(order.orderedAt.toString(), style:  const TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold),)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Total Amount Payed in This Order : '),
              Text('\$${order.totalPrice.toString()}', style:  TextStyle(color: Colors.green.shade400,fontWeight: FontWeight.bold , fontSize: 17 ,),)
            ],
          ),
        ],
      ),
    );
  }

}