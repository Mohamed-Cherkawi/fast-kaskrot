import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  final String barName;
  dynamic leadingIcon;

   AppBarWidget({super.key, required this.barName , this.leadingIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.black,
      child: Padding(
        padding:  const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 15,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if( leadingIcon != null )
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, '/');
                    },
                    child: Icon(
                      leadingIcon ,
                      color: Colors.white,
                    ),
                  ),
             Text(
                barName,
                style: const TextStyle(
                    color: Colors.white ,
                    fontWeight: FontWeight.w900 ,
                    fontSize: 16 ,
                    letterSpacing: 1
                ),
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
      ),
    );
  }

}