import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/news_item_list.dart';
import '../model/news_model.dart';
import '../services/api_service.dart';

class AllNews extends StatefulWidget {
  const AllNews({super.key});

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  APIService apiService = APIService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(future: apiService.getAllNews(), builder: (context,snapshot){
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
