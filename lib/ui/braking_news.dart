import 'package:flutter/material.dart';
import 'package:newsapp/components/news_item_list.dart';
import 'package:newsapp/model/news_model.dart';
import 'package:newsapp/service/api_service.dart';

class BrakingNews extends StatefulWidget {
  const BrakingNews({super.key});

  @override
  State<BrakingNews> createState() => _BrakingNewsState();
}

class _BrakingNewsState extends State<BrakingNews> {

  ApiService apiService=ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: apiService.getBrakingNews(),
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