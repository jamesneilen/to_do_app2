import 'package:flutter/material.dart';
import 'firstscreen.dart';
//import 'bot_shift.dart';
import 'note_pad_screen2.dart';
import 'todo/secondscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'Flutter Demo',
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const List<Widget> _widgetOptions = <Widget>[
    NoteList(),
    SecondScreen()
  ];

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(currentIndex),
      ),
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
              : showBottomSheet(context: context);
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
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.note), label: 'Notes'),
          BottomNavigationBarItem(
              icon: Icon(Icons.task_alt_outlined), label: 'To-Dos')
        ],
      ),
    );
  }

  showBottomSheet({required BuildContext context}) async {
    return showModalBottomSheet(
      backgroundColor: const Color.fromARGB(255, 52, 52, 52),
      context: context,
      builder: (context) {
        return Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'Add a to-do item',
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          IconButton(
                            //style: ButtonStyle(iconSize:)),
                            onPressed: () {},
                            icon: const Icon(Icons.alarm),
                            tooltip: 'Set an Alarm',
                          ),
                          const Text(
                            'Set Alarm',
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                      child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: TextButton(
                            onPressed: () {},
                            child: const Text('SAVE'),
                          )))
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
