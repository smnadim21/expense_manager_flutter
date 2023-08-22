import 'package:floor/floor.dart';
import 'package:money_manager/db/entity.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'converter.dart';
import 'dao.dart';



part 'driver_database.g.dart';

@TypeConverters([DateTimeConverter])
@Database(version: 2, entities: [Account])
abstract class MoneyDB extends FloorDatabase {
  LocalDao get localDao;
}

class LocalDB {
  static MoneyDB? db;

  static Future<MoneyDB> initDb() async {
    return await $FloorMoneyDB.databaseBuilder('money_database.db').build();
  }

  static MoneyDB? getDao() {
    initDb();
    return db;
  }
}
