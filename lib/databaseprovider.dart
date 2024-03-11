import 'package:sqflite/sqflite.dart';

import 'model/note.dart';

class DatabaseProvider {
  final Database database;

  DatabaseProvider(this.database);

  Future<List<Note>> getNotes() async {
    final List<Map<String, dynamic>> maps = await database.query('notes');

    return List.generate(maps.length, (index) {
      return Note(
          id: maps[index]['id'],
          title: maps[index]['title'],
          description: maps[index]['content'],
          created_at: maps[index]['time']);
    });
  }

  Future<void> updateNote(Note note) async {
    await database.update(
      'notes',
      note.toJson(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  Future<void> saveNote(Note note) async {
    await database.insert(
      'notes',
      note.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteNote(int id) async {
    await database.delete(
      'notes',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
