import 'package:fast_kaskrot/models/meal.dart';
import 'package:flutter/material.dart';

import '../config/sql_db_config.dart';

class MealService {
  SqlDb database = SqlDb();
  final String tableName = 'meal';

  Future<void> insertMeal(Meal meal) async {
    final int response = await database.insertData(tableName, meal.toMap());
    if(response != 0) {
      debugPrint('$meal has been saved successfully');
    }
  }

  Future<List<Meal>> meals() async {
    final List<Map<String, dynamic>> maps = await database.queryData(tableName);

    // Convert the List<Map<String, dynamic> into a List<Meal>.
    return _listGenerator(maps);
  }

  Future<List<Meal>> getMealsByRestaurantId(int id) async {
    final List<Map<String, dynamic>> maps = await database.queryDataById(tableName,'restaurant_id' ,id);

    return _listGenerator(maps);
  }

  List<Meal> _listGenerator(List<Map<String, dynamic>> maps) {
    return List.generate(maps.length, (i) {
      return Meal(
      id: maps[i]['id'],
      imageName: maps[i]['image_name'],
      title: maps[i]['title'],
      availability: maps[i]['availability'],
      description: maps[i]['description'],
      price: maps[i]['price'],
      restaurantId: maps[i]['restaurant_id']
      );
    });
  }
}