import 'package:flutter/material.dart';

class RestaurantSection extends StatelessWidget {
  final String imageName;
  final String rating;
  final String name;
  final String address;

  const RestaurantSection(
      {super.key, required this.imageName, required this.rating, required this.name,required this.address}
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      margin: const EdgeInsets.symmetric(vertical: 6 , horizontal: 10),
      decoration:  const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: Column(
          children: [
            SizedBox(
              height: 200,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20) ,
                    topRight: Radius.circular(20)
                ),
                child: Image.asset(
                  'assets/images/$imageName',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Padding(
                        padding: const EdgeInsets.only(left: 4,bottom: 5),
                        child: Text(
                          name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold ,
                              fontSize: 16
                          ),
                        ),
                      ),
                      Row(
                        children:  [
                          const Icon(Icons.place_outlined),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(address),
                          )
                        ],
                      )
                    ],
                  ),
                  Container(
                    width: 70,
                    decoration: BoxDecoration(
                        color: const Color(0xFF167918),
                        borderRadius: BorderRadius.circular(5)
                    ),
                    padding: const EdgeInsets.all(7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        const Icon(
                            Icons.star,
                            size: 10,
                            color: Colors.white
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            rating,
                            style: const TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ]
      ),
    );
  }
}