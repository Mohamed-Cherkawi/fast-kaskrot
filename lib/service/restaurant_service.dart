import 'package:fast_kaskrot/config/sql_db_config.dart';
import 'package:fast_kaskrot/models/restaurant.dart';
import 'package:flutter/material.dart';

class RestaurantService {
  SqlDb database = SqlDb();

  Future<void> insertRestaurant(Restaurant restaurant) async {
    final int response = await database.insertData('restaurant', restaurant.toMap());
    if(response != 0) {
      debugPrint('$restaurant has been saved successfully');
    }
  }

  // A method that retrieves all the dogs from the dogs table.
  Future<List<Restaurant>> restaurants() async {
    // Get a reference to the database.
    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await database.queryData('restaurant');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
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