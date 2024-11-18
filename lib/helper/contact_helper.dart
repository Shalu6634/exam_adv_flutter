import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  DbHelper._();

  static DbHelper dbHelper = DbHelper._();

  Database? _db;

  Future<Database> get database async =>_db ?? await initDatabase();
  Future<Database> initDatabase() async {

    String path = await getDatabasesPath();
    String dbPath = join(path, 'Contact.db');
    _db = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
        String sql = '''CREATE TABLE Contact(id INTEGER PRIMARY KEY,name TEXT,phone TEXT,email TEXT,docId TEXT)''';
        return await db.execute(sql);
      },
    );
    return _db!;
  }

  Future<List<Map<String, Object?>>> readContactData()
  async {
    Database? db = await  database;
    String sql = '''SELECT * FROM Contact''';
    return await db.rawQuery(sql);

  }
  Future<void> insertContact(String name,String phone,String email,String docId)
  async {
    Database? db = await  database;
    String sql = '''INSERT INTO Contact(name,phone,email,docId) VALUES(?,?,?,?);''';
    List args = [name,phone,email,docId];
   await  db.rawInsert(sql,args);
  }

  Future<void> removeDetail(int id) async {
    Database? db = await database;
    String sql = '''DELETE FROM Contact WHERE id = ?''';
    List<dynamic> args = [id];
    await db.rawDelete(sql, args);
  }
  Future<void> updateContact(String name,String phone, String email,int id)
  async {
    Database? db =await database;
    String sql = '''UPDATE Contact SET name = ?,phone = ?,email=? WHERE id =?''';
    List args = [name,phone,email,id];
    await db.rawUpdate(sql,args);
  }


}