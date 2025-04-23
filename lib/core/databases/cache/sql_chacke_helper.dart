import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('subscribers.db');
    return _database!;
  }

  Future<Database> _initDB(String fileName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, fileName);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE subscribers (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        fullName TEXT,
        waterMeterSN TEXT,
        category TEXT,
        area TEXT,
        address TEXT,
        note TEXT,
        installDate TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE entitlements (
        entitlNo INTEGER PRIMARY KEY,
        id INTEGER,
        entitlDate TEXT,
        entitlMonth TEXT,
        beginMeter INTEGER,
        endMeter INTEGER,
        amount INTEGER,
        price INTEGER,
        entitlemented INTEGER,
        FOREIGN KEY (id) REFERENCES subscribers (id) ON DELETE CASCADE
      )
    ''');

    await db.execute('''
      CREATE TABLE payments (
        payNo INTEGER PRIMARY KEY,
        id INTEGER,
        payDate TEXT,
        entitlNo INTEGER,
        FOREIGN KEY (id) REFERENCES subscribers (id) ON DELETE CASCADE,
        FOREIGN KEY (entitlNo) REFERENCES entitlements (entitlNo) ON DELETE CASCADE
      )
    ''');
  }

  // Future<int> insertSubscriber(SubscriberModel subscriber) async {
  //   final db = await instance.database;
  //   return await db.insert('subscribers', subscriber.toJson());
  // }

  // Future<int> insertEntitlement(Entitlements entitlement) async {
  //   final db = await instance.database;
  //   return await db.insert('entitlements', entitlement.tojson());
  // }

  // Future<int> insertPayment(Payments payment) async {
  //   final db = await instance.database;
  //   return await db.insert('payments', payment.tojson());
  // }

  // Future<List<Map<String, dynamic>>> getSubscribers() async {
  //   final db = await instance.database;
  //   return await db.query('subscribers');
  // }

  Future<int> deleteSubscriber(int id) async {
    final db = await instance.database;
    return await db.delete('subscribers', where: 'id = ?', whereArgs: [id]);
  }
}
