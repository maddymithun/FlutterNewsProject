import 'dart:convert';
import 'package:news_project/model/news_model.dart';
import 'package:http/http.dart';

class APIService{
  final all_news_url="https://newsapi.org/v2/everything?q=bitcoin&apiKey=8a475280eff74597a60c85a9d78ad96f";
  final breking_news_url="https://newsapi.org/v2/top-headlines?country=us&apiKey=8a475280eff74597a60c85a9d78ad96f";
  Future<List<NewsModel>>getAllNews()async{
    try{
      Response response= await get(Uri.parse(all_news_url));
    if (response.statusCode==200){
    Map<String,dynamic>json=jsonDecode(response.body);
    List<dynamic>body=json['articles'];
    List<NewsModel>articleList=body.map((item) => NewsModel.fromJson(item)).toList();
    return articleList;
    }else{
      throw("No response found");
    }
    }catch(e){
      throw e;
    }
  }
  Future<List<NewsModel>>getBreakingNews()async{
    try{
      Response response= await get(Uri.parse(breking_news_url));
      if (response.statusCode==200){
        Map<String,dynamic>json=jsonDecode(response.body);
        List<dynamic>body=json['articles'];
        List<NewsModel>breakingNewsList=body.map((item) => NewsModel.fromJson(item)).toList();
        return breakingNewsList;
      }else{
        throw("No response found");
      }
    }catch(e){
      throw e;
    }
  }
}