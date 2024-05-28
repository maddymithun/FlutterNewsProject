import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_project/components/news_item_list.dart';
import 'package:news_project/model/news_model.dart';
import 'package:news_project/services/api_service.dart';

class BreakingNews extends StatefulWidget {
  const BreakingNews({super.key});

  @override
  State<BreakingNews> createState() => _BreakingNewsState();
}

class _BreakingNewsState extends State<BreakingNews> {
  APIService apiService = APIService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(future: apiService.getBreakingNews(), builder: (context,snapshot){
    if(snapshot.hasData){
      List<NewsModel>breakingNewsList=snapshot.data ?? [];
      return ListView.builder
        (itemBuilder: (context,index){
      return NewsItemList(newsModel: breakingNewsList[index]);
      },
        itemCount: breakingNewsList.length,
      );
    }
    return const Center(child: CircularProgressIndicator(),);
      },
      ),
    );
  }
}
