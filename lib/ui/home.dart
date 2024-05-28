import 'package:flutter/material.dart';
import 'package:news_project/ui/all_news.dart';
import 'package:news_project/ui/breaking_news.dart';

class HomePage extends StatefulWidget{
  const HomePage({Key? key}):super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2, child: Scaffold(
      appBar: AppBar(title: const Text("Flutter NewsApp"),bottom: const TabBar(
        tabs: [
          Tab(text: "Breaking News",),
          Tab(text: "All News",)
        ],
      ),) ,
      body: const TabBarView(
        children: [
          BreakingNews(),
          AllNews(),
        ],
      ),
    ));
  }
}