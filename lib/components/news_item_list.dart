import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/model/news_model.dart';
import 'package:newsapp/ui/news_details.dart';

class NewsItemList extends StatelessWidget {

  final NewsModel newsModel;
  const NewsItemList({super.key,required this.newsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NewsDetails(newsModel: newsModel)));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        margin: EdgeInsets.symmetric(horizontal: 12),
      
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
      
            CachedNetworkImage(
              height: 250,
              width: double.infinity,
              fit: BoxFit.fitWidth,
          imageUrl: newsModel.urlToImage.toString(),
          placeholder: (context, url) => Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => Icon(Icons.error),
       ),
         SizedBox(height: 8,),
         Row(
           children: [
             Container(child: Text(newsModel.source!.name.toString()),
             padding: EdgeInsets.all(6),
             decoration: BoxDecoration(
              color: Colors.red,borderRadius: BorderRadius.circular(30)),
             
             ),
             SizedBox(width: 8,),
            
            Text(newsModel.publishedAt.toString())
      
           ],
         ),
         SizedBox(height: 8,),
            Text(newsModel.author == null
                ? ""
                : "Written By " + newsModel.author.toString()),
      
                SizedBox(height: 8,),
            Text(newsModel.title.toString())
          ],
        ),
      ),
    );
  }
}