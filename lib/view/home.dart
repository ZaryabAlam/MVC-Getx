import 'package:flutter/material.dart';
import 'package:getx/view/photoScreen.dart';
import 'package:getx/view/postScreen.dart';
import 'package:getx/view/todoScreen.dart';
import 'package:getx/view/userScreen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Getx MVC"),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.post_add_rounded), text: "Posts"),
              Tab(icon: Icon(Icons.person_pin_rounded), text: "Users"),
              Tab(icon: Icon(Icons.note_add_rounded), text: "Todos"),
              Tab(icon: Icon(Icons.photo_album_rounded), text: "Photos"),
            ],
          ),
        ),
        body: const TabBarView(children: [
          PostScreen(),
          UserScreen(),
          TodoScreen(),
          PhotoScreen(),
        ]),
      ),
    );
  }
}
