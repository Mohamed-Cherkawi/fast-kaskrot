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
  Future<String> getDatabasePath() async {
    return join(await getDatabasesPath() , 'kaskrot.db');
  }
  Future<Database> initialDb() async {
    WidgetsFlutterBinding.ensureInitialized();
    return await openDatabase(await getDatabasePath(),onCreate: onCreate , version: 31 , onUpgrade: onUpgrade);
  }

  Future<void> onCreate(Database db , int version) async {
    await db.execute('''
    CREATE TABLE "meal" (
      "id" INTEGER  NOT NULL,
      "image_name" TEXT NOT NULL,
      "title" TEXT NOT NULL,
      "availability" TEXT NOT NULL,
      "description" TEXT NOT NULL,
      "price" REAL NOT NULL,
      "restaurant_id" INTEGER NOT NULL
      )
      ''');
    await db.execute('''
      CREATE TABLE "restaurant" (
      "id" INTEGER NOT NULL,
      "name" TEXT NOT NULL,
      "address" TEXT NOT NULL,
      "image_name" TEXT NOT NULL,
      "rating" TEXT NOT NULL
      )
      ''');
    await db.execute('''
      INSERT INTO restaurant (id,image_name,rating,name,address) VALUES (1,'le_tacos_de_lyon.jpg','4.3','Tacos de lyon','Marrakesh 4000 , Palestinian road')
      ''');
    await db.execute('''
      INSERT INTO restaurant (id,image_name,rating,name,address) VALUES (2,'mc-donalds.jpg','5.5','Mac Donald s','Marrakesh 4000 , Sidi Abad')
      ''');
    await db.execute('''
      INSERT INTO restaurant (id,image_name,rating,name,address) VALUES (3,'bawlo.jpg','3.4','Bawlo','Marrakesh 4000 , Jamaa El Fena')
      ''');
    await db.execute('''
      INSERT INTO restaurant (id,image_name,rating,name,address) VALUES (4,'pizza-hut.jpg','5.2','Pizza Hut','Marrakesh 4000 , Casablanca road , Diour Marjane')
      ''');

    await db.execute('''
      INSERT INTO meal (id,image_name,title,availability,description,price,restaurant_id) VALUES (1,'tacos-nuggets.png','Tacos Nuggets','lunch,dinner','Massive nuggets tacos ,with \npreferred sauce + 1 fries',35.00,1)
      ''');
    await db.execute('''
      INSERT INTO meal (id,image_name,title,availability,description,price,restaurant_id) VALUES (2,'tacos-xxl.png','Tacos XXL','lunch,dinner','Massive giant tacos ,with \npreferred sauce + 2 fries',55.00,1)
      ''');
    await db.execute('''
      INSERT INTO meal (id,image_name,title,availability,description,price,restaurant_id) VALUES (3,'big-tasty.jpg','Big Tasty','lunch,dinner','Delicious Tasty Hamburger,\n + 1 fries + 1 soda',45.00,2)
      ''');
    await db.execute('''
      INSERT INTO meal (id,image_name,title,availability,description,price,restaurant_id) VALUES (4,'mac-flurry.png','Mac Flurry','lunch,dinner','Fresh ice cream eminem,\nkitkat,twix',20.00,2)
      ''');
    await db.execute('''
      INSERT INTO meal (id,image_name,title,availability,description,price,restaurant_id) VALUES (5,'happy-meal.png','Happy Meal','lunch,dinner','Incredible hamburger for\n childrens,+1(fries,soda,game)',30.00,2)
    ''');
    // await db.execute('''
    // ALTER TABLE meal
    //   ADD CONSTRAINT FK_meal_restaurant
    //   FOREIGN KEY (restaurant_id)
    //   REFERENCES restaurant(id);
    //   ''');

    debugPrint('============ Create Database and Tables ================');
  }

  Future<void> onUpgrade(Database database , int oldVersion , int newVersion) async {
    debugPrint("=================  OnUpgrade called =================");
  }
  deleteMyDatabase() async {
    await deleteDatabase(await getDatabasePath());
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
  Future<List<Map<String, dynamic>>> queryDataById(String table , String column , int id) async {
    Database? database = await db;
    return await database.query(table , where: '$column = ?', whereArgs: [id]);
  }
}