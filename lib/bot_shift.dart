import 'package:flutter/material.dart';

showBottomSheet({required BuildContext context}) async {
  return showModalBottomSheet(
    backgroundColor: const Color.fromARGB(255, 52, 52, 52),
    context: context,
    builder: (context) {
      return const Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Card(
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
          SizedBox(
            height: 4,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        Icon(Icons.alarm),
                        Text(
                          'Set alerts',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Text('SAVE'),
              ],
            ),
          ),
        ],
      );
    },
  );
}
