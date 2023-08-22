import 'dart:convert';

import 'package:floor/floor.dart';

import 'driver_database.dart';

class Table {
  static const String Account = "accounts";
}

@Entity(tableName: Table.Account, primaryKeys: ["id"])
class Account {
  int? id;
  String name;
  String? icon;
  int initBalance;
  String currencyName;

  Account(
      {this.id,
      required this.name,
      this.icon,
      this.initBalance = 0,
      this.currencyName = "BDT"});

  Account copyWith(
          {int? id,
          String? name,
          String? icon,
          int? initBalance,
          String? currencyName}) =>
      Account(
          id: id ?? this.id,
          name: name ?? this.name,
          icon: icon ?? this.icon,
          initBalance: initBalance ?? this.initBalance,
          currencyName: currencyName ?? this.currencyName);

  factory Account.fromRawJson(String str) => Account.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Account.fromJson(Map<String, dynamic> json) => Account(
      id: json["id"],
      name: json["name"],
      icon: json["icon"],
      initBalance: json["init_balance"],
      currencyName: json["currency_name"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "icon": icon,
        "init_balance": initBalance,
        "currency_name": currencyName
      };

  Future<Account> save() async {
    final database = await LocalDB.initDb();
    if (database != null) {
      id = await database.localDao.insertAccount(this);
    } else {
      print("HOROR !");
    }
    return this;
  }

  static Future<List<Account>> all() async {
    final database = await LocalDB.initDb();
    return database.localDao.getAllAccounts();
  }

  static Future<void> deleteAll() async {
    final database = await LocalDB.initDb();
    return database.localDao.deleteAllAccounts();
  }

  Future<Account> update() async {
    final database = await LocalDB.initDb();
    if (database != null) {
      await database.localDao.update(this);
    } else {
      print("HOROR !");
    }
    return this;
  }

  Future<void> delete() async {
    final database = await LocalDB.initDb();
    return database.localDao.deleteAccount(this);
  }
}
