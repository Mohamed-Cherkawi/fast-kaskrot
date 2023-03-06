import 'package:fast_kaskrot/components/app_bar.dart';
import 'package:fast_kaskrot/components/bottom_navigation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children:  [
            Container(
                height: 60,
                color: Colors.black,
                child: const AppBarWidget(barName: 'Home')
            ),
        ],
      ),
        // bottom: PreferredSize(
        //     preferredSize: const Size.fromHeight(50),
        //     child: Row(
        //       children: [
        //         Text('data')
        //       ],
        //     )
        // ),
      );

  }

}