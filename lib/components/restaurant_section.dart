import 'package:flutter/material.dart';

class RestaurantSection extends StatelessWidget {
  const RestaurantSection({super.key});

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
                  'assets/images/le_tacos_de_lyon.jpg',
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
                      const Padding(
                        padding: EdgeInsets.only(left: 4,bottom: 5),
                        child: Text(
                          'Tacos de Lyon',
                          style: TextStyle(
                              fontWeight: FontWeight.bold ,
                              fontSize: 16
                          ),
                        ),
                      ),
                      Row(
                        children: const [
                          Icon(Icons.place_outlined),
                          Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Text('Marrakesh 4994 , Palestine road'),
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
                      children: const [
                        Icon(
                            Icons.star,
                            size: 10,
                            color: Colors.white
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            '4.1',
                            style: TextStyle(color: Colors.white),
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