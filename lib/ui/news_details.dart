
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_project/model/news_model.dart';
import 'package:news_project/model/news_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
class NewsDetails extends StatefulWidget {
  final NewsModel newsModel;
  const NewsDetails({super.key,required this.newsModel});

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
    title: Text(widget.newsModel.title.toString()),
    ),
      body: Column(
        
        children: [
          CachedNetworkImage(
            height: 200,
            width: double.infinity,
            fit: BoxFit.fitWidth,
            imageUrl: widget.newsModel.urlToImage.toString(),
            placeholder: (context, url) => Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          SizedBox(height: 8,),
          Row(
            children: [
              Container(child: Text(widget.newsModel.source!.name.toString()),padding: EdgeInsets.all(6),decoration: BoxDecoration(
                  color: Colors.red,borderRadius: BorderRadius.circular(30)
              ),
              ),
              SizedBox(width: 8,),
              Text(widget.newsModel.publishedAt.toString())
            ],
          ),
          SizedBox(height: 8,),
          Text(widget.newsModel.author.toString()==null? "" : "Written By "+widget.newsModel.author.toString()),
          SizedBox(height: 8,),
          Text(widget.newsModel.title.toString()),
          SizedBox(height: 8,),
        ],
      ),
    );
  }
}

