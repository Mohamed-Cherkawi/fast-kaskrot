import 'package:flutter/material.dart';

class RestaurantImage extends StatelessWidget {
  final String imageName;

  const RestaurantImage({super.key ,required this.imageName});

  @override
   Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
          children: [
            Image.asset(
              'assets/images/$imageName',
              fit: BoxFit.cover,
            ),
            Positioned(
                bottom: 10,
                right: 80,
                child: Container(
                  padding: const EdgeInsets.all(7),
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(12))
                  ),
                  child: InkWell(
                    onTap: (){},
                    child: const Icon(
                        Icons.phone ,
                        color: Colors.white
                    ),
                  ),
                )
            ),
            Positioned(
                bottom: 10,
                right: 20,
                child: Container(
                  padding: const EdgeInsets.all(7),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(12))
                  ),
                  child: InkWell(
                    onTap: (){},
                    child: const Icon(
                        Icons.directions ,
                        color: Colors.black
                    ),
                  ),
                )
            ),
          ]
      ),
    );
  }
}