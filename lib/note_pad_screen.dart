import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'global_variables.dart';
import 'firstscreen.dart';
import 'note_services.dart';
import 'note_pad_screen2.dart';
import 'dart:ui';

class NotePadScreen extends StatefulWidget {
  const NotePadScreen({super.key});

  @override
  State<NotePadScreen> createState() => _NotePadScreenState();
}

class _NotePadScreenState extends State<NotePadScreen> {
  List<Note> filteredNotes = [];
  List? list;

  Future getAllNote() async {
    list = await NoteController().fetchAllNote();
    setState(() {
      filteredNotes = List<Note>.from(list!);
    });
    log(list.toString());
  }

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      getAllNote();
    });
  }

  void onSearchTextChanged(String searchText) {
    final filteredNotes = sampleNotes
        .where((note) =>
            note.content.toLowerCase().contains(searchText.toLowerCase()) ||
            note.title.toLowerCase().contains(searchText.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Card(
              child: TextField(
                onChanged: onSearchTextChanged,
                decoration: const InputDecoration(
                  hintText: 'Search notes',
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: list?.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Text(list![index]['id'].toString()),
                      title: Text(list![index]['title'].toString()),
                      subtitle: Text(list![index]['created_at'].toString()),
                    );
                  }),
            )
          ],
        ),
      ),

      //  IndexedStack(
      //      index: currentIndex,
      //       children: pages,
      //     ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
        ),
        onPressed: () {
          currentIndex == 0
              ? Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Notes(),
                  ),
                )
              : const NoteList();
          // } else if (currentIndex == 1) {
          //   Navigator.push(
          //       context, MaterialPageRoute(builder: (context) => const ToDo()));
          //   // showBottomSheet(context: context);
          //  }
        },
        child: Icon(
          Icons.add,
          semanticLabel: 'Add',
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black,
        // currentIndex: value,
        selectedItemColor: Colors.green,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.note,
            ),
            // activeIcon: Icon(Icons.note_add),
            label: 'Notes',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(255, 39, 38, 38),
            icon: Icon(
              Icons.task_alt,
            ),
            label: 'To-dos',
          ),
        ],
        type: BottomNavigationBarType.fixed,

        elevation: 5,
      ),
    );
  }
}
