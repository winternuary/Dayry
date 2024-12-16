import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/diary_entry.dart';

class DBService {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    final path = join(await getDatabasesPath(), 'diary.db');
    return openDatabase(path, version: 1, onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE diary_entries(id INTEGER PRIMARY KEY, title TEXT, content TEXT, date TEXT)",
      );
    });
  }

  Future<void> insertEntry(DiaryEntry entry) async {
    final db = await database;
    await db.insert('diary_entries', entry.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<DiaryEntry>> getEntries() async {
    final db = await database;
    final maps = await db.query('diary_entries');
    return List.generate(maps.length, (i) => DiaryEntry.fromMap(maps[i]));
  }
}
