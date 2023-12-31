import 'package:myapp/models/task.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database? _db;

  static const int _version = 1;
  static const String _tableName = "tasks";

  static Future<void> initDb() async {
    if (_db != null) {
      return;
    }
    final databasesPath = await getDatabasesPath();
    final path = '${databasesPath}todo.db';

    try {
      _db = await openDatabase(
        path,
        version: _version,
        onCreate: (db, version) async {
          await db.execute('''
          CREATE TABLE $_tableName(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            note TEXT,
            isCompleted INTEGER,
            selectedDate TEXT,
            startTime TEXT,
            endTime TEXT,
            selectedRemind INTEGER,
            selectedRepeat TEXT,
            selectedColor INTEGER
          )
        ''');
        },
      );
    } catch (e) {
      initDb();
    }
  }

  static Future<int> insert(TaskToDo? task) async {
    return await _db?.insert(_tableName, task!.toJson()) ?? 1;
  }
}
