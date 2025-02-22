import 'package:flutter/material.dart';
import 'package:testx_app/todo/todos.dart';

import 'todoinfo.dart';

// class ToDo {
//   final String title;
//   final String description;

//   const ToDo(this.title, this.description);
//   ToDo copyWith({String? newTitle, String? newDescription}) {
//     return ToDo(
//       newTitle ?? title,
//       newDescription ?? description,
//     );
//   }
// }

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  List<Todos> filteredTodos = [];

  @override
  void initState() {
    super.initState();
    filteredTodos = sampleTodos;
  }

  void filterTodos(String query) {
    setState(() {
      filteredTodos = sampleTodos
          .where((todo) =>
              todo.title.toLowerCase().contains(query.toLowerCase()) ||
              todo.description.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'To-dos',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 30,
            ),
          ),
          actions: [
            PopupMenuButton(
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(
                    child: Text(
                      'Sort by alert time',
                    ),
                  ),
                ];
              },
              child: const Icon(Icons.more_vert),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 10,
            ),
            Card(
              child: TextField(
                onChanged: filterTodos,
                decoration: const InputDecoration(
                  hintText: 'Search to-dos',
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: filteredTodos.length,
                  itemBuilder: (BuildContext context, int index) {
                    final todo = filteredTodos[index];
                    return Card(
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: ListTile(
                                leading: IconButton(
                                  icon:
                                      const Icon(Icons.radio_button_unchecked),
                                  onPressed: () {},
                                ),
                                title: Text(todo.title),
                                subtitle: Text(todo.description),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => TodoInfo(
                                              toDo: sampleTodos[index])));
                                },
                              )),
                        ));
                  }),
            ),
          ]),
        ));
  }
}
