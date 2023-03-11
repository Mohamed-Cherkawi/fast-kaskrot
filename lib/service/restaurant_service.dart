import 'package:fast_kaskrot/config/sql_db_config.dart';
import 'package:fast_kaskrot/models/restaurant.dart';
import 'package:flutter/material.dart';

class RestaurantService {
  SqlDb database = SqlDb();
  final String tableName = 'restaurant';

  Future<void> insertRestaurant(Restaurant restaurant) async {
    final int response = await database.insertData(tableName, restaurant.toMap());
    if(response != 0) {
      debugPrint('$restaurant has been saved successfully');
    }
  }

  Future<List<Restaurant>> restaurants() async {
    final List<Map<String, dynamic>> maps = await database.queryData(tableName);

    // Convert the List<Map<String, dynamic> into a List<Restaurant>.
    return _listGenerator(maps);
  }
  Future<List<Restaurant>> getRestaurantsId(int id) async {
    final List<Map<String, dynamic>> maps = await database.queryDataById(tableName, id);

    return _listGenerator(maps);
  }
  List<Restaurant> _listGenerator(List<Map<String, dynamic>> maps) {
    return List.generate(maps.length, (i) {
      return Restaurant(
        id: maps[i]['id'],
        imageName: maps[i]['image_name'],
        name: maps[i]['name'],
        address: maps[i]['address'],
        rating: maps[i]['rating'],
      );
    });
  }
}