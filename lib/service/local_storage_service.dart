import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  List<String>? _mealsIds = [];
  static SharedPreferences? _localStorageInstance;

  List<String> get mealsIds => _mealsIds!;
  Future<SharedPreferences> get localStorageInstance async {
    return _localStorageInstance ??= await SharedPreferences.getInstance();
  }
// []
  Future<void> addMealIdToList(String id) async{
    await getStringList();
    print(mealsIds);
    if(mealsIds.contains(id)){
        return;
    }
    _mealsIds!.add(id);
    print(mealsIds);
    setStringList();
  }
  Future<void> removeMealIdFromList(String id) async {
    getStringList();
    _mealsIds!.remove(id);
    setStringList();
  }
  Future<void> setStringList() async {
    SharedPreferences storage = await localStorageInstance;
    await storage.setStringList('mealsIds', _mealsIds!);
  }
  Future<void> getStringList() async {
     SharedPreferences storage = await localStorageInstance;
     _mealsIds = storage.getStringList('mealsIds');
   }
}