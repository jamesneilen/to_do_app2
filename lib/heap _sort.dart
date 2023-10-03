import 'package:flutter/material.dart';

class HeapSort extends StatelessWidget {
  const HeapSort({super.key});

  @override
  Widget build(BuildContext context) {
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
    );
  }
}
