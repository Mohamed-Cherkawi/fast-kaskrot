import 'package:flutter/material.dart';

class Meal extends StatefulWidget {
  const Meal({super.key});

  @override
  State<Meal> createState() => _MealState();
}

class _MealState extends State<Meal> {
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
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              image: DecorationImage(
                  image: AssetImage('assets/images/pizza-margareta.png'),
                  fit: BoxFit.cover
              )
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
                const Text(
                  'Pizza Margarita' ,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      letterSpacing: 1
                  ),
                ) ,
                const Text('Availability : lunch , dinner'),
                const Text('Spicy delicious pizza , \n take 2 and get one for free'),
                Container(
                  width: 220,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                        const Text(
                          '\$45.00' ,
                          style: TextStyle(
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