import 'package:instant_label_user/db/table/histroy/history_table.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const _dbName = "historydb.db";
  static const _dbVersion = 2;

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  static Future<Database> getDB() async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  static Future<Database> initDatabase() async {
    print("reaching --12");
    String path = join(await getDatabasesPath(), _dbName);
    print(path);
    return await openDatabase(
      path,
      version: _dbVersion,
      onCreate: (db, version) async {
        print("reaching inside--12.333");
        // db.execute(HistTableDB.createTable);
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        print('onupgrade');
        await HistTableDB.createTable(db, newVersion);
      },
      
    );
  }
}
