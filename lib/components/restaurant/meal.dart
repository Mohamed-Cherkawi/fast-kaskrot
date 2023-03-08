import 'package:flutter/material.dart';

class Meal extends StatefulWidget {
  final String imageName;
  final String title;
  final List<String> availability;
  final String description;
  final double price;

  const Meal(
      {super.key, required this.imageName,
      required this.title,
      required this.availability,
      required this.description,
      required this.price
      });

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
            decoration:  BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              image: DecorationImage(
                  image: AssetImage('assets/images/${widget.imageName}'),
                  fit: BoxFit.cover
              )
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
                 Text(
                  widget.title ,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      letterSpacing: 1
                  ),
                ) ,
                 Text('Availability : ${widget.availability.join(",")}'),
                 Text(widget.description),
                SizedBox(
                  width: 220,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                         Text(
                          '\$${widget.price.toString()}' ,
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