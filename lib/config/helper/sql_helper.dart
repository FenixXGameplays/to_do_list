import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../../infrastucture/model/item.dart';

class SqlHelper {
  static Future<Database> _openDB() async {
    return openDatabase(join(await getDatabasesPath(), 'listacompra.db'),
        onCreate: (db, version) {
      return db.execute(
          "CREATE TABLE IF NOT EXISTS productos (nombreProducto TEXT, cantidad INTEGER, categoria TEXT)");
    }, version: 1);
  }

  static Future<void> insertItem(Item data) async {
    final db = await SqlHelper._openDB();

    await db.insert('productos', data.toJson());
  }

  static Future<void> removeItem(Item data) async {
    final db = await SqlHelper._openDB();

    await db.delete('productos', where: 'nombreProducto = ?', whereArgs: [data.nameProduct]);
  }

  static Future<List<Item>> getProducts() async {
    final db = await SqlHelper._openDB();

    final List<Map<String, dynamic>> productosMap =
        await db.query("productos");
    final List<Item> finalList = [];

    for (var producto in productosMap) {
      finalList.add(Item.fromJson(producto));
    }

    return finalList;
  }
}
