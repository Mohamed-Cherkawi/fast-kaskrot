import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  final String mealIdKeyPair = 'mealsIds';
  List<String>? _mealsIds = [];
  static SharedPreferences? _localStorageInstance;

  List<String> get mealsIds => _mealsIds!;
  Future<SharedPreferences> get localStorageInstance async {
    return _localStorageInstance ??= await SharedPreferences.getInstance();
  }
// []
  Future<void> addMealIdToList(String id) async{
    _mealsIds = await getStringList();
    print(mealsIds);
    if(mealsIds.contains(id)){
        return;
    }
    _mealsIds!.add(id);
    print(mealsIds);
    setStringList();
  }
  Future<void> removeMealIdFromList(String id) async {
    _mealsIds = await getStringList();
    _mealsIds!.remove(id);
    setStringList();
  }
  Future<void> setStringList() async {
    SharedPreferences storage = await localStorageInstance;
    await storage.setStringList(mealIdKeyPair, _mealsIds!);
  }
  Future<void> clearListFromLocalStorage() async{
    SharedPreferences storage = await localStorageInstance;
    await storage.setStringList(mealIdKeyPair,[]);
  }
  Future<List<String>?> getStringList() async {
     SharedPreferences storage = await localStorageInstance;
    return storage.getStringList(mealIdKeyPair);
   }
}