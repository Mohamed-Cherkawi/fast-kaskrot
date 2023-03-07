import 'package:flutter/material.dart';

class MenuBadges extends StatelessWidget {
  final List<String> mealTypes;

  const MenuBadges({super.key, required this.mealTypes});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: mealTypes.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: (){},
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            width: 100,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(15)
            ),
            child: Text(
              mealTypes[index] ,
              style: const TextStyle(
                  color: Colors.white
              ),
            ),
          ),
        );
      },
    );
  }

}