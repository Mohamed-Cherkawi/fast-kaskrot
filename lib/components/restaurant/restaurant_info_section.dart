import 'package:fast_kaskrot/components/restaurant/menu_badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app_bar.dart';

class RestaurantInfo extends StatelessWidget {
  final String imageName;

  const RestaurantInfo({super.key ,required this.imageName});

  @override
   Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
            height: 60,
            color: Colors.black,
            child:  AppBarWidget(leadingIcon: Icons.arrow_back_outlined,barName: 'Restaurant')
        ),
        SizedBox(
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
      ),
        Container(
            height: 130,
            width: double.infinity,
            //color: Colors.deepPurpleAccent,
            padding: const EdgeInsets.symmetric(vertical: 30 , horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Tacos de Lyon",
                  style: TextStyle(
                      fontWeight: FontWeight.w900 ,
                      fontSize: 20 ,
                      letterSpacing: 2
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: 5),
                          child: Icon(
                            Icons.place_outlined ,
                            color: CupertinoColors.systemGrey,
                          ),
                        ),
                        Text(
                          'Marrakesh 4000 , Palestinian road' ,
                          style: TextStyle(
                              color: CupertinoColors.systemGrey,
                              fontSize: 10 ,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: 5),
                          child: Icon(
                              Icons.access_time_outlined ,
                              color: CupertinoColors.systemGrey
                          ),
                        ),
                        Text(
                            '4:00 AM - 11:00 PM' ,
                            style: TextStyle(
                                color: CupertinoColors.systemGrey,
                                fontSize: 10 ,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold
                            )
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        Container(
          height: 130,
          padding: const EdgeInsets.symmetric(vertical: 20 , horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Our Menu",
                style: TextStyle(
                    fontWeight: FontWeight.w900 ,
                    fontSize: 20 ,
                    letterSpacing: 2
                ),
              ),
              SizedBox(
                  height: 50,
                  child: MenuBadges(mealTypes: ['Appetizers','Breakfast','Lunch','Mains'])
              )
            ],
          ),
        ),
        Container(
          height: 100,
          padding: const EdgeInsets.symmetric(vertical: 20 , horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Appetizers",
                style: TextStyle(
                    fontWeight: FontWeight.w900 ,
                    fontSize: 20 ,
                    letterSpacing: 2
                ),
              ),
            ],
          ),
        )
      ]
    );
  }
}