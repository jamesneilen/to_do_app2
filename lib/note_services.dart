import '../database/ntdatabase.dart';
import '../model/note.dart';

class NoteController {
  final conn = NoteDatabase.instance;

  Future<int> addNote(Note noteinfoModel) async {
    var dbclient = await conn.db;
    int result = 0;
    try {
      result = await dbclient!
          .insert(NoteDatabase.noteTable, noteinfoModel.toJson());
    } catch (e) {
      print(e.toString());
    }
    return result;
  }

  Future<int> updateNote(Note noteinfoModel) async {
    var dbclient = await conn.db;
    int result = 0;
    try {
      result = await dbclient!.update(
          NoteDatabase.noteTable, noteinfoModel.toJson(),
          where: 'id=?', whereArgs: [noteinfoModel.id]);
    } catch (e) {
      print(e.toString());
    }
    return result;
  }

  Future fetchAllNote() async {
    var dbclient = await conn.db;
    List noteList = [];
    try {
      List<Map<String, dynamic>> maps =
          await dbclient!.query(NoteDatabase.noteTable, orderBy: 'id ASC');
      for (var item in maps) {
        noteList.add(item);
      }
    } catch (e) {
      print(e.toString());
    }
    return noteList;
  }
}
