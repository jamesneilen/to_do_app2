import 'package:flutter/material.dart';
import 'package:testx_app/global_variables.dart';

// import 'databaseprovider.dart';

class HeapSort extends StatefulWidget {
  const HeapSort({
    super.key,
  });

  @override
  State<HeapSort> createState() => _HeapSortState();
}

class _HeapSortState extends State<HeapSort> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Note firstNote = sampleNotes[0];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        actions: [
          const Icon(
            Icons.share,
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
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _contentController,
              decoration: const InputDecoration(labelText: 'Content'),
              maxLines: null,
            ),
          ],
        ),
      ),
    );
  }
}
