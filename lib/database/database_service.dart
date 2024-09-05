import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:flutter_food_delivery_app/models/food.dart';
import 'dart:io';

class DatabaseService {
  static const String _dbName = 'restaurant.db';
  static const String _menuStoreName = 'menu';

  late Database _db;
  final _store = intMapStoreFactory.store(_menuStoreName);

  static final DatabaseService _singleton = DatabaseService._internal();

  factory DatabaseService() {
    return _singleton;
  }

  DatabaseService._internal();

  Future<void> init() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String dbPath = '${appDocDir.path}/$_dbName';
    _db = await databaseFactoryIo.openDatabase(dbPath);
  }

  Future<void> addFood(Food food) async {
    await _store.add(_db, food.toMap());
  }

  Future<List<Food>> getMenu() async {
    final recordSnapshots = await _store.find(_db);
    return recordSnapshots.map((snapshot) {
      return Food.fromMap(snapshot.value);
    }).toList();
  }

  Future<void> clearMenu() async {
    await _store.delete(_db);
  }
}
