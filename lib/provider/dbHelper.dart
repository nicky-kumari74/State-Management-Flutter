
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper{
  static Database? _db;
  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await initDB();
    return _db!;
  }
  Future<Database> initDB() async {
    String path= join(await getDatabasesPath(),'notes.db');
    return await openDatabase(
        path,
        version: 1,
        onCreate: (db,version) async{
          await db.execute('CREATE TABLE notes (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, desc TEXT)');
        }
    );
  }
  Future<void> addNotes(String title, String desc) async{
    final dbclient= await db;
    await dbclient.insert(
        'notes',
        {'title':title,'desc':desc},
        conflictAlgorithm: ConflictAlgorithm.replace
    );
  }
  Future<List<Map<String,dynamic>>> getNotes() async{
    final dbclient = await db;
    return await dbclient.query('notes');
  }
}