import 'package:fast_kaskrot/models/meal.dart';
import 'package:flutter/material.dart';

class MealWidget extends StatelessWidget {
  final Meal meal;

  const MealWidget({super.key, required this.meal,});

  @override
  Widget build(BuildContext context) {
   return Container(
      height: 140,
      margin: const EdgeInsets.symmetric(vertical: 15),
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
         color: Colors.white,
         borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:  [
          Container(
            margin: const EdgeInsets.only(right: 10),
            width: 100,
            decoration:  BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              image: DecorationImage(
                  image: AssetImage('assets/images/${meal.imageName}'),
                  fit: BoxFit.cover
              )
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
                 Text(
                  meal.title ,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      letterSpacing: 1
                  ),
                ) ,
                 Text('Availability : ${meal.availability}'),
                 Text(meal.description),
                SizedBox(
                  width: 220,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                         Text(
                          '\$${meal.price.toString()}' ,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                      ),
                      Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                              color: Colors.black ,
                              borderRadius: BorderRadius.all(Radius.circular(8))
                          ),
                          child: const Icon(Icons.add , color: Color(0xFFEDE7E7)),
                      )
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