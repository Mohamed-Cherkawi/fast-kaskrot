import 'package:flutter/material.dart';

import '../app_bar.dart';

class RestaurantImage extends StatelessWidget {
  final String imageName;

  const RestaurantImage({super.key ,required this.imageName});

  @override
   Widget build(BuildContext context) {
    return Column(
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
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(30))
                      ),
                      child: InkWell(
                        onTap: (){},
                        child: const Icon(
                            Icons.phone ,
                            color: Colors.black
                        ),
                      ),
                    )
                ),
                Positioned(
                    bottom: 10,
                    right: 20,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(30))
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
        )
      ],
    );
  }

}