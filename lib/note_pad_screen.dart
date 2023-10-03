import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'global_variables.dart';
// import 'package:mfa_2/main.dart';
import 'firstscreen.dart';
import 'note_services.dart';
import 'secondscreen.dart';
// import 'bot_shift.dart';
import 'note_pad_screen2.dart';
import 'dart:ui';
//import 'note_pad_screen2.dart';

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
    log(list.toString());
  }

  int currentIndex = 0;
  // getDrawerItemWidget(int pos) {
  //   switch (pos) {
  //     case 0:
  //       return const Notes();
  //     case 1:
  //       return const ToDo();
  //     default:
  //       return const Text("Error");
  //   }
  // }

  //List<String> appList = ["Notes", "TO-Do"];

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
                    return const ListTile(
                        // leading: Text(list?[index]['id'].toString()??),
                        // title: Text(list![index]['title'].toString()),
                        //subtitle: Text(list![index]['created_at'].toString()),
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
        child: const Icon(
          Icons.add,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
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
        // currentIndex: value,
        selectedItemColor: Colors.blueAccent,

        // elevation: 5,
      ),
    );
  }
}
