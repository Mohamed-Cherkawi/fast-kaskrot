import 'package:fast_kaskrot/service/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../models/meal.dart';
import '../../util/AppColor.dart';

class CartItem extends StatefulWidget {
  final Function refreshParentHolderState;
  final Function(int mealId, double totalMealPrice) updatePriceById;
  final Meal meal;

  const CartItem({super.key, required this.meal , required this.refreshParentHolderState , required this.updatePriceById});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int quantity = 1;
  double totalMealPrice = 0;

  void calculateQuantity(bool isIncrementing){
    isIncrementing ? quantity++ : quantity--;
    setState(() {
      totalMealPrice = widget.meal.price * quantity;
    });
  }
  void updatePriceInParentMap() {
    widget.updatePriceById(widget.meal.id,totalMealPrice);
  }
  @override
  void initState() {
    super.initState();
    setState(() {
      totalMealPrice = widget.meal.price;
    });
  }
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
                      onTap: () async{
                        await LocalStorageService().removeMealIdFromList(widget.meal.id.toString());
                          widget.refreshParentHolderState();
                      },
                    )
                  ],
                ),
              ),
              Text('Availability : ${widget.meal.availability}'),
              SizedBox(
                width: 220,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            padding : const EdgeInsets.all(2),
                            decoration: const BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.all(Radius.circular(5))),
                            child: InkWell(
                                child: SvgPicture.asset('assets/icons/minus.svg'),
                                onTap: (){
                                  if(quantity >= 2) {
                                    setState(() {
                                      calculateQuantity(false);
                                      updatePriceInParentMap();
                                    });
                                  }
                                })
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            quantity.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold ,
                                fontSize: 19
                            )
                          ),
                        ),
                        Container(
                            padding : const EdgeInsets.all(2),
                            decoration: const BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.all(Radius.circular(5))),
                            child: InkWell(
                                child:  Icon(Icons.add, color: AppColor.iconColor),
                                onTap: (){
                                  if(quantity <= 6) {
                                      calculateQuantity(true);
                                      updatePriceInParentMap();
                                  }
                                })
                        ),
                      ],
                    ),

                    Text(
                      '\$$totalMealPrice',
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