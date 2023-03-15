import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../models/meal.dart';
import '../../util/AppColor.dart';

class CartItem extends StatefulWidget {
  final Meal meal;
  int quantity = 1;

  CartItem({super.key, required this.meal});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            width: 120,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                image: DecorationImage(
                    image: AssetImage('assets/images/${widget.meal.imageName}'),
                    fit: BoxFit.cover)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 220,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.meal.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          letterSpacing: 1),
                    ),
                    InkWell(
                        child: const Icon(
                          Icons.cancel ,
                          size: 29,
                        ),
                      onTap: (){
                          print('hello');
                      },
                    )
                  ],
                ),
              ),
              Text('Availability : ${widget.meal.description}'),
              SizedBox(
                width: 220,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            decoration: const BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.all(Radius.circular(5))),
                            child: InkWell(
                                child: SvgPicture.asset('assets/icons/minus.svg'),
                                onTap: (){
                                  setState(() {
                                    widget.quantity--;
                                  });
                                })
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            widget.quantity.toString(),
                            style: const TextStyle(fontWeight: FontWeight.bold)
                          ),
                        ),
                        Container(
                            decoration: const BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.all(Radius.circular(5))),
                            child: InkWell(
                                child:  Icon(Icons.add, color: AppColor.iconColor),
                                onTap: (){
                                  setState(() {
                                    widget.quantity++;
                                  });
                                })
                        ),
                      ],
                    ),

                    Text(
                      '\$${widget.meal.price}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}