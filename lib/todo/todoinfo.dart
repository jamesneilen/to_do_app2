import 'package:flutter/material.dart';

import 'todos.dart';

class TodoInfo extends StatefulWidget {
  final Todos toDo;
  const TodoInfo({super.key, required this.toDo});

  @override
  State<TodoInfo> createState() => _TodoInfoState();
}

class _TodoInfoState extends State<TodoInfo> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  String? _editedTitle;
  String? _editedDescription;

  @override
  void initState() {
    super.initState();
    _editedTitle = widget.toDo.title;
    _editedDescription = widget.toDo.description;
    _titleController = TextEditingController(text: widget.toDo.title);
    _descriptionController =
        TextEditingController(text: widget.toDo.description);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.toDo.title,
          style: TextStyle(color: Colors.blue),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              maxLines: 1,
              onChanged: (value) {
                setState(() {
                  _editedTitle = value;
                });
              },
              controller: TextEditingController(text: _editedTitle),
              decoration: const InputDecoration.collapsed(
                border: InputBorder.none,
                hintText: 'Title',
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              maxLines: sampleTodos.length,
              onChanged: (value) {
                setState(() {
                  _editedDescription = value;
                });
              },
              controller: TextEditingController(text: _editedDescription),
              decoration: const InputDecoration.collapsed(
                hintText: 'Description',
              ),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     ToDo updatedNote = widget.toDo.copyWith(
            //       newTitle: _editedTitle,
            //       newDescription: _descriptionController.text,
            //     );
            //   },
            //   child: Text('Save'),
            // )
          ],
        ),
      ),
    );
  }
}
