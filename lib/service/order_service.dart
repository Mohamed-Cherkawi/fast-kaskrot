import 'package:fast_kaskrot/config/sql_db_config.dart';
import 'package:fast_kaskrot/models/order.dart';
import 'package:fast_kaskrot/service/local_storage_service.dart';
import 'package:fast_kaskrot/service/meal_service.dart';
import 'package:flutter/cupertino.dart';

class OrderService {
  SqlDb database = SqlDb();
  final MealService mealService = MealService();
  LocalStorageService localStorageService = LocalStorageService();
  final String tableName = 'orders';

  Future<List<Order>> orders() async{
    final List<Map<String, dynamic>> maps = await database.queryData(tableName);

    // Convert the List<Map<String, dynamic> into a List<Order>
    return _listGenerator(maps);
  }
  Future<Order> getOrderById(int id) async {
    final List<Map<String, dynamic>> maps = await database.queryDataById(tableName,'id' ,id);

    return _listGenerator(maps).first;
  }

  Future<void> createOrder(double totalPrice) async {
    print('&&&&&&&&&&&&&&&&&&&&&______________________________');
    print(totalPrice.toString());
    final int response = await database.insertRawData('''
      INSERT INTO $tableName (ordered_at,total_price,ordered_by) VALUES (CURRENT_TIMESTAMP,$totalPrice,1);
    ''');

    if (response != 0) {
      debugPrint('A new order has been successfully created in database');
      localStorageService.clearListFromLocalStorage();
    }
  }

  Future<List<int>> getMealsByOrderId(int id) async {
    final List<Map<String, dynamic>> maps = await database.queryDataById(tableName, 'order_id', id);

    return getMealsIds(maps);
  }

  List<int> getMealsIds(List<Map<String, dynamic>> maps) {
    return List.generate(maps.length, (i) {
      return maps[i]['meal_id'];
    });
  }
  List<Order> _listGenerator(List<Map<String, dynamic>> maps) {
    return List.generate(maps.length, (i) {
      return Order(
        id: maps[i]['id'],
        orderedAt: maps[i]['ordered_at'],
        totalPrice: maps[i]['total_price'],
        orderedBy: maps[i]['ordered_by']
      );
    });
  }
}