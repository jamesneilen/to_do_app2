import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.minimize,
          color: Color.fromARGB(193, 10, 0, 0),
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  child: Text('Sort by alert time'),
                ),
              ];
            },
            child: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'To-dos',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Card(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search to-dos',
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            SizedBox(
              height: 80,
              width: double.infinity,
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.circle_outlined,
                              size: 15,
                            )),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text(
                          'welcome to To-do',
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              
              height: 80,
              width: double.infinity,
              child: Card(
                elevation: 5,
                child: Padding(
                  
                  padding: const EdgeInsets.all(10.0),
                  child: Align(
                  
                    alignment: Alignment.centerLeft,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.circle_outlined,
                              size: 15,
                            )),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text(
                          'Tap on to-do content to edit it',
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 80,
              width: double.infinity,
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.circle_outlined,
                              size: 15,
                            )),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text(
                          'create your to-dos by typing',
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
