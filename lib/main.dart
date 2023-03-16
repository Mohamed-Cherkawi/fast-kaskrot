import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:fast_kaskrot/pages/cart_page.dart';
import 'package:fast_kaskrot/pages/history_page.dart';
import 'package:fast_kaskrot/pages/home_page.dart';
import 'package:fast_kaskrot/pages/restaurant_info_page.dart';
import 'package:fast_kaskrot/util/AppColor.dart';
import 'package:flutter/material.dart';

void initializeNotification(){
  AwesomeNotifications().initialize(null, [
    NotificationChannel(channelKey: 'chanelKey',
        channelName: 'Basic notifications',
        channelDescription: 'Notifivation channel for basic tests')
  ],
      debug: true
  );
}
void main() async {
  initializeNotification();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  void initState() {
    super.initState();
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) => {
      if(!isAllowed){
        AwesomeNotifications().requestPermissionToSendNotifications()
      }
    });

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: AppColor.scaffoldBackColor
      ),
      routes: {
        '/' : (context) =>  const HomePage(),
        'restaurant-info' : (context) =>  RestaurantWidget(restaurantId: ModalRoute.of(context)!.settings.arguments as int),
        'cart' : (context) => const CartPage(),
        'orders-history' : (context) => HistoryPage()
        },
    );
  }
}