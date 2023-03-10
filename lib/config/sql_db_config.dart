import 'dart:async';

import 'package:fast_kaskrot/models/meal.dart';
import 'package:fast_kaskrot/models/restaurant.dart';
import 'package:fast_kaskrot/service/restaurant_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';

import '../service/meal_service.dart';

class SqlDb {

  static Database? _db;

  Future<Database> get db async {
    return _db ??= await initialDb();
  }

  Future<Database> initialDb() async {
    WidgetsFlutterBinding.ensureInitialized();
    final String path = join(await getDatabasesPath() , 'kaskrot.db');
    return await openDatabase(path,onCreate: onCreate , version: 19 , onUpgrade: onUpgrade);
  }

  Future<void> onCreate(Database db , int version) async {
    await db.execute('''
    CREATE TABLE "meal" (
      "id" INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT,
      "image_name" TEXT NOT NULL,
      "title" TEXT NOT NULL,
      "availability" TEXT NOT NULL,
      "description" TEXT NOT NULL,
      "price" REAL NOT NULL
    ''');
    await db.execute('''
    CREATE TABLE "restaurant" (
      "id" INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT,
      "name" TEXT NOT NULL,
      "address" TEXT NOT NULL,
      "image_name" TEXT NOT NULL,
      "rating" TEXT NOT NULL
      )
      ''');
    await db.execute('''
    ALTER TABLE meal
      ADD CONSTRAINT FK_meal_restaurant
      FOREIGN KEY (restaurant_id)
      REFERENCES restaurant(id)
      ''');
    debugPrint('============ Create Database and Tables ================');
  }

  Future<void> onUpgrade(Database database , int oldVersion , int newVersion) async {
    //RestaurantService restaurantService = RestaurantService();
    // restaurantService.insertRestaurant(Restaurant(id: 1,imageName: 'le_tacos_de_lyon.jpg', rating: '4.3', name: "Tacos de lyon", address: "Marrakesh 4000 , Palestinian road"));
    // restaurantService.insertRestaurant(Restaurant(id: 2,imageName: 'mc-donalds.jpg', rating: '5.5', name: "Mac Donald's", address: "Marrakesh 4000 , Sidi Abad"));
    // restaurantService.insertRestaurant(Restaurant(id: 4,imageName: 'bawlo.jpg', rating: '3.4', name: "Bawlo", address: "Marrakesh 4000 , Jamaa El Fena"));
    // restaurantService.insertRestaurant(Restaurant(id: 3,imageName: 'pizza-hut.jpg', rating: '5.2', name: "Pizza Hut", address: "Marrakesh 4000 , Casablanca road , Diour Marjane"));
    
    MealService mealService = MealService();

    mealService.insertMeal(
        Meal(id: 2 , imageName: 'tacos-nuggets.png',title: 'Tacos Nuggets' , availability: 'lunch,dinner' , description: 'Massive nuggets tacos ,with \npreferred sauce + 1 fries',price: 35.00 , restaurantId: 1)
    );
    mealService.insertMeal(
        Meal(id: 3 , imageName: 'tacos-xxl.png',title: 'Tacos XXL' , availability: 'lunch,dinner' , description: 'Massive giant tacos ,with \npreferred sauce + 2 fries',price: 55.00 , restaurantId: 1)
    );
    mealService.insertMeal(
        Meal(id: 4 , imageName: 'big-tasty.jpg',title: 'Big Tasty' , availability: 'lunch,dinner' , description: 'Delicious Tasty Hamburger, + 1 fries + 1 soda',price: 45.00 , restaurantId: 2)
    );
    mealService.insertMeal(
        Meal(id: 5 , imageName: 'mac-flurry.png',title: 'Mac Flurry' , availability: 'breakfast,lunch,dinner' , description: 'Fresh Coled ice cream with eminem,kitkat,twix',price: 20.00 , restaurantId: 2)
    );
    mealService.insertMeal(
        Meal(id: 6 , imageName: 'happy-meal.png',title: 'Happy Meal' , availability: 'lunch,dinner' , description: 'Incrdible hamburger meal for childrens ,+1 fries +1 soda +1 game ',price: 30.00 , restaurantId: 2)
    );
    debugPrint("=================  OnUpgrade called =================");
  }

  Future< List< Map < String,Object? > > > selectData(String query) async {
    Database? database = await db;
    return await database.rawQuery(query);
  }
  Future<int> insertRawData(String query) async {
    Database? database = await db;
    return await database.rawInsert(query); // return the last inserted row id , returns 0 if something went wrong
  }
  Future<int> updateData(String query) async {
    Database? database = await db;
    return await database.rawUpdate(query); // return numbers of changes made
  }
  Future<int> deleteData(String query) async {
    Database? database = await db;
    return await database.rawDelete(query); // return numbers of changes made
  }
  Future<int> insertData(String table , Map<String,Object?> values) async{
    Database? database = await db;
    return await database.insert(table,values ,conflictAlgorithm: ConflictAlgorithm.replace);
  }
  Future<List<Map<String, dynamic>>> queryData(String table) async {
    Database? database = await db;
    return await database.query(table);
  }
}