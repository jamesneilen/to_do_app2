import 'dart:developer';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class NoteDatabase {
  NoteDatabase.internal();
  static final NoteDatabase instance = NoteDatabase.internal();
  factory NoteDatabase() => instance;
  static String noteTable = "noteDatabase";
  final _version = 3;
  Database? _db;
  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  Future<Database> initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String dbPath = join(directory.path, 'noteDatabase.db');
    log(dbPath);
    var openDb = await openDatabase(dbPath, version: _version,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE $noteTable(id INTEGER PRIMARY KEY AUTOINCREMENT,title TEXT NOT NULL,description TEXT,created_at TEXT)');
    }, onUpgrade: (Database db, int oldVersion, int newVersion) async {
      if (oldVersion < newVersion) {
        log("Version Upgrade");
      }
    });
    log('db initialize');
    return openDb;
  }
}
