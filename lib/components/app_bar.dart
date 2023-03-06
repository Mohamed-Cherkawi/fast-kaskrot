import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  final String barName;

  const AppBarWidget({super.key, required this.barName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Text(
              barName,
              style: const TextStyle(color: Colors.white),
          ),
          InkWell(
            onTap: (){},
            child: const Icon(
                Icons.notifications_none ,
                color: Colors.white
            ),
            ),
        ],
      ),
    );
  }

}