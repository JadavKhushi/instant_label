import 'package:instant_label_user/db/db_helper.dart';
import 'package:instant_label_user/db/table/histroy/history_model.dart';

class HistTableDB {
  static const table = 'histTable';

  static const _colBarcode = 'barcode';
  static const _colName = 'proName';
  static const _colCategory = 'proCategory';
  static const _colImage = 'proImage';

  // static const createTable = """ CREATE TABLE IF NOT EXISTS histTable(
  //   $_colBarcode TEXT NOT NULL,
  //   $_colName TEXT NOT NULL,
  //   $_colCategory TEXT NOT NULL,
  //   $_colImage TEXT NOT NULL); """;

  // static Future<void> createTable(db, version) async{
  //   print("--------Create table----------");
  //     await db.execute('''
  //       CREATE TABLE $table(
  //         $_colBarcode TEXT NOT NULL,
  //         $_colName TEXT NOT NULL,
  //         $_colCategory TEXT NOT NULL,
  //         $_colImage TEXT NOT NULL,
  //       )
  //       ''');
  // }

  static Future<void> createTable(db, version) async {
    print("--------Create table----------");
    await db.execute('CREATE TABLE $table'
        '($_colBarcode TEXT NOT NULL,'
        '$_colName TEXT NOT NULL,'
        '$_colCategory TEXT NOT NULL,'
        '$_colImage TEXT NOT NULL'
        ')');
  }

  // static insertData(HistoryModelTable historyModelTable) async {
  //   final db = await DatabaseHelper.getDB();
  //   await db.insert(HistTableDB.table, {
  //     HistTableDB._colBarcode: historyModelTable.barcode,
  //     HistTableDB._colName: historyModelTable.name,
  //     HistTableDB._colCategory: historyModelTable.category,
  //     HistTableDB._colImage: historyModelTable.image,
  //   });
  // }
  // db.rawInsert(
  //     'INSERT INTO $table'
  //     '$_colBarcode, $_colName, $_colCategory, $_colImage'
  //     'VALUES(?,?,?,?)',
  //     [
  //       historyModelTable.barcode,
  //       historyModelTable.name,
  //       historyModelTable.category,
  //       historyModelTable.image
  //     ]);
  // await db.insert(
  //   table,
  //   {
  //     'column1': historyModelTable.barcode,
  //     'column2': historyModelTable.name,
  //     'column3': historyModelTable.category,
  //     'column4': historyModelTable.image,
  //   },
  // );

  static Future<List<HistoryModelTable>> findAll() async {
    final db = await DatabaseHelper.getDB();
    List<HistoryModelTable> list = [];
    final rows = await db.rawQuery("SELECT * FROM $table");
    print(rows);
    if (rows.isNotEmpty) {
      for (Map<String, Object?> element in rows) {
        print("element $element");
        list.add(HistoryModelTable.format(element));
      }
    }
    return list;
  }

  // Future<List<HistoryModelTable>> findAllyBarcode() async {
  //    List<HistoryModelTable> list = [];
  //   final db = await DatabaseHelper.getDB();
  //   final rows = await db.rawQuery(
  //       'SELECT * FROM histTable WHERE column1 = Barcode', ['8901058008463']);
  //   if (rows.isNotEmpty) {
  //     for (Map<String, Object?> element in rows) {
  //       list.add( HistoryModelTable.format(element));
  //     }
  //   }

  //   return list;
  // }
}

//INSERT INTO histTable (column1, column2, column3, column4) VALUES (?, ?, ?, ?)
