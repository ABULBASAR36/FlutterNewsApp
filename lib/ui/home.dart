import 'package:flutter/material.dart';
import 'package:newsapp/ui/all_news.dart';
import 'package:newsapp/ui/braking_news.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Flutter News Apps"),
            bottom: const TabBar(
              tabs: [
                Tab(text: "Breaking",),
                Tab(text: "All News",),
              ]
              ),
          ),
          body: const TabBarView(
            children: [
               BrakingNews(),
               AllNews(),
            ]
          ),
        ));
  }
}
