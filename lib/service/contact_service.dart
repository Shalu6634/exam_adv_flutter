import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ContactHelper {
  ContactHelper._();

  static ContactHelper contactHelper = ContactHelper._();

  Database? _db;

  // Future get database()=>

  Future get database async => _db ?? await initDatabase();

  Future<Database?> initDatabase() async {
    final path = await getDatabasesPath();
    final dbPath = join(path, 'Contact.db');

    _db = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
        String sql = '''CREATE TABLE Contact(
        id INTEGER PRIMARY KEY,
        name TEXT,
        email TEXT,
        phone TEXT
        )''';
        return await db.execute(sql);
      },
    );
    return _db;
  }

  Future<List<Map<String, Object?>>> readData() async {
    Database? db = await database;
    String sql = '''
    SELECT * FROM Contact
    ''';
    return await db!.rawQuery(sql);
  }

  Future<void> insertContactData(
      String name, String phone, String email) async {
    Database? db = await database;
    String sql = '''INSERT INTO Contact(name, phone, email) VALUES(?, ?, ?);''';
    List<dynamic> args = [name, phone, email];
    await db!.rawInsert(sql, args);
  }

  Future<void> updateData(
      int id, String name, String phone, String email) async {
    Database? db = await database;
    String sql =
        '''UPDATE Contact SET name = ?, phone = ?, email = ? WHERE id = ?;''';
    List<dynamic> args = [
      name,
      phone,
      email,
      id
    ]; // Corrected the order of arguments
    await db!.rawUpdate(sql, args);
  }

  Future<void> removeDetail(int id) async {
    Database? db = await database;
    String sql = '''DELETE FROM Contact WHERE id = ?''';
    List<dynamic> args = [id];
    await db!.rawDelete(sql, args);
  }

  Future<List<Map<String, Object?>>> readLiveData(String name) async {
    Database? db = await database;
    String sql = "SELECT * FROM Contact WHERE name LIKE '%$name%'";

    return await db!.rawQuery(sql);
  }
}
