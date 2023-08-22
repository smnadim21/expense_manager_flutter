// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorMoneyDB {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$MoneyDBBuilder databaseBuilder(String name) =>
      _$MoneyDBBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$MoneyDBBuilder inMemoryDatabaseBuilder() => _$MoneyDBBuilder(null);
}

class _$MoneyDBBuilder {
  _$MoneyDBBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$MoneyDBBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$MoneyDBBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<MoneyDB> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$MoneyDB();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$MoneyDB extends MoneyDB {
  _$MoneyDB([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  LocalDao? _localDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 2,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `accounts` (`id` INTEGER, `name` TEXT NOT NULL, `icon` TEXT, `initBalance` INTEGER NOT NULL, `currencyName` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  LocalDao get localDao {
    return _localDaoInstance ??= _$LocalDao(database, changeListener);
  }
}

class _$LocalDao extends LocalDao {
  _$LocalDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _accountInsertionAdapter = InsertionAdapter(
            database,
            'accounts',
            (Account item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'icon': item.icon,
                  'initBalance': item.initBalance,
                  'currencyName': item.currencyName
                }),
        _accountUpdateAdapter = UpdateAdapter(
            database,
            'accounts',
            ['id'],
            (Account item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'icon': item.icon,
                  'initBalance': item.initBalance,
                  'currencyName': item.currencyName
                }),
        _accountDeletionAdapter = DeletionAdapter(
            database,
            'accounts',
            ['id'],
            (Account item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'icon': item.icon,
                  'initBalance': item.initBalance,
                  'currencyName': item.currencyName
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Account> _accountInsertionAdapter;

  final UpdateAdapter<Account> _accountUpdateAdapter;

  final DeletionAdapter<Account> _accountDeletionAdapter;

  @override
  Future<List<Account>> getAllAccounts() async {
    return _queryAdapter.queryList('SELECT * from accounts',
        mapper: (Map<String, Object?> row) => Account(
            id: row['id'] as int?,
            name: row['name'] as String,
            icon: row['icon'] as String?,
            initBalance: row['initBalance'] as int,
            currencyName: row['currencyName'] as String));
  }

  @override
  Future<void> deleteAllAccounts() async {
    await _queryAdapter.queryNoReturn('DELETE from accounts');
  }

  @override
  Future<int> insertAccount(Account account) {
    return _accountInsertionAdapter.insertAndReturnId(
        account, OnConflictStrategy.replace);
  }

  @override
  Future<int> update(Account account) {
    return _accountUpdateAdapter.updateAndReturnChangedRows(
        account, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteAccount(Account account) async {
    await _accountDeletionAdapter.delete(account);
  }
}

// ignore_for_file: unused_element
final _dateTimeConverter = DateTimeConverter();
