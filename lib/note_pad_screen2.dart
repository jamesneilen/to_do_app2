import 'dart:async';
import 'dart:developer';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

import 'model/note.dart';
import 'note_services.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  List? _list;
  Timer? _time;
  DateTime? now;
  String formattedDate = '';

  @override
  void initState() {
    super.initState();
    getAllNote();
    now = DateTime.now();
    formattedDate = DateFormat('kk:mm\n EEE d MMM').format(now!);
  }

  @override
  void dispose() {
    super.dispose();
    title.dispose();
    description.dispose();
  }

  Future<void> getAllNote() async {
    _list = await NoteController().fetchAllNote();
    log(_list.toString());
  }

  void clearInput() {
    title.clear();
    description.clear();
  }

  void saveNote() async {
    if (title.text.isEmpty || description.text.isEmpty) {
      print("All fields are required");
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red,
          content: Text('All fields are required')));
      return;
    }

    Note noteInfo = Note(
        id: null,
        title: title.text,
        description: description.text,
        created_at: DateTime.now().toString());

    try {
      int value = await NoteController().addNote(noteInfo);
      if (value > 0) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.green,
            content: Text('Note Added Successful!')));
        setState(() {
          _list?.add(noteInfo);
          log(_list.toString());
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.red, content: Text('Failed to add note')));
      }
    } catch (e) {
      print("Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red, content: Text('Failed to add note')));
    }
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('kk:mm\n EEE d MMM').format(now);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(formattedDate.toString()),
              TextField(
                controller: title,
                decoration: const InputDecoration(
                  hintText: 'Title',
                  hintStyle: TextStyle(
                    fontSize: 10,
                  ),
                  border: InputBorder.none,
                ),
              ),
              SizedBox(
                child: TextField(
                  maxLines: null,
                  controller: description,
                  decoration: const InputDecoration(
                    hintText: 'Note something down',
                    hintStyle: TextStyle(
                      fontSize: 10,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     Note noteInfo = Note(
              //       id: null,
              //       title: title.text,
              //       description: description.text,
              //       created_at: formattedDate.toString(),
              //     );
              //   },
              SingleChildScrollView(
                child: GestureDetector(
                  onTap: saveNote,
                  child: const Center(
                    child: SizedBox(
                      width: 100,
                      child: Card(
                        color: Colors.white10,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Save',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.blue,
                            ),
                            selectionColor: Colors.blueGrey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
      // ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.grey,
      //   child: const Icon(
      //     Icons.save,
      //     size: 35,
      //   ),
      //   onPressed: () async {
      //     // Navigator.pop(context, [title.text, description.text]);
      //     if (title.text.isEmpty || description.text.isEmpty) {
      //       print("All Field are required");
      //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //           backgroundColor: Colors.red,
      //           content: Text('All Field are required')));
      //     } else {
      //       Note noteInfo = Note(
      //           id: null,
      //           title: title.text,
      //           description: description.text,
      //           created_at: DateTime.now().toString());

      //       await NoteController().addNote(noteInfo).then((value) {
      //         if (value > 0) {
      //           ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //               backgroundColor: Colors.green,
      //               content: Text('Note Added Sucessful!')));
      //           log(_list.toString());
      //         } else {
      //           ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //               backgroundColor: Colors.red,
      //               content: Text('Fail to add note')));
      //         }
      //       });
      //     }
      //   },
      // )
      bottomNavigationBar: BottomAppBar(
        height: 88,
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.insert_photo_rounded),
                ),
                const Text(
                  'Albums',
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.mic),
                ),
                const Text(
                  'Audio',
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.task_alt),
                ),
                const Text(
                  'To-do list',
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.alarm,
                  ),
                ),
                const Text(
                  'Reminder',
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
