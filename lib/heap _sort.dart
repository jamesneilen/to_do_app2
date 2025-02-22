import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:testx_app/global_variables.dart';
import 'package:share/share.dart';

class HeapSort extends StatefulWidget {
  final Note firstNote;
  HeapSort({super.key, required this.firstNote});

  @override
  State<HeapSort> createState() => _HeapSortState();
}

class _HeapSortState extends State<HeapSort> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  String? _editedTitle;
  String? _editedDescription;

  @override
  void initState() {
    super.initState();
    _editedDescription = widget.firstNote.content;
    _editedTitle = widget.firstNote.title;
    _titleController = TextEditingController(text: widget.firstNote.title);
    _descriptionController =
        TextEditingController(text: widget.firstNote.content);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String noteContent = widget.firstNote.title + widget.firstNote.content;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notes',
          style: TextStyle(color: Colors.blue),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.share,
            ),
            onPressed: () {
              Share.share(noteContent);
            },
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: PopupMenuButton(
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(
                    child: Text('Delete'),
                  ),
                ];
              },
              child: const Icon(
                Icons.more_vert,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              selectionHeightStyle: BoxHeightStyle.max,
              onChanged: (value) {
                setState(() {
                  _editedTitle = value;
                });
              },
              decoration: const InputDecoration.collapsed(hintText: 'title'),
              maxLines: 1,
              expands: false,
              controller: TextEditingController(text: _editedTitle),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              onChanged: (value) {
                setState(() {
                  _editedDescription;
                });
              },
              controller: _descriptionController,
              style: const TextStyle(fontSize: 16),
              decoration: InputDecoration.collapsed(hintText: 'description'),
              maxLines: sampleNotes.length,
            ),
          ],
        ),
      ),
    );
  }
}
