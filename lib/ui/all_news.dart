import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/components/news_item_list.dart';
import 'package:newsapp/model/news_model.dart';
import 'package:newsapp/service/api_service.dart';

class AllNews extends StatefulWidget {
  const AllNews({super.key});

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {

ApiService apiService=ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: apiService.getAllNews(),
        builder: (context,snapshot){
          if(snapshot.hasData)
          {
            List<NewsModel>articlesList=snapshot.data ?? [];
            return ListView.builder(
              itemBuilder: (context,index){
              return NewsItemList(
                newsModel: articlesList[index],
                );

            },
            itemCount:articlesList.length,
            );
          }
           return const Center(child: CircularProgressIndicator(),
         );
        },

        ),
    );
  }
}