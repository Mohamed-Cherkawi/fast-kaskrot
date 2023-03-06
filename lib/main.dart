import 'package:fast_kaskrot/pages/home_page.dart';
import 'package:fast_kaskrot/util/AppColor.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: AppColor.scaffoldBackColor
      ),
      routes: {
        '/' : (context) => const HomePage(),
        'test' : (context) =>  Container()
        // 'restaurant-menu' : (context) => const HomePage(),
        // 'cart' : (context) => const RegisterWidget(),
        // 'orders-history' : (context) => const
        //'profile' : (context) => Scaffold(),
        //'transaction' : (context) => Transaction()
        },
    );
  }
}