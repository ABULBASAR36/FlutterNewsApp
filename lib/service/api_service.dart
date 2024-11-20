import 'dart:convert';

import 'package:http/http.dart';
import 'package:newsapp/model/news_model.dart';

class ApiService{

  final all_news_url="https://newsapi.org/v2/everything?q=bitcoin&apiKey=f9ab26f2784b4557adfb0ae8a37aa47f";

  final braking_news_url="https://newsapi.org/v2/top-headlines?country=us&apiKey=f9ab26f2784b4557adfb0ae8a37aa47f";

  Future<List<NewsModel>>getAllNews()async{
   
   try{
    Response response=await get(Uri.parse(all_news_url));
    if(response.statusCode==200)
    {
      Map<String,dynamic> json=jsonDecode(response.body);

      List<dynamic>body=json['articles'];

      List<NewsModel>articlesList =body.map((item)=>NewsModel.fromJson(item)).toList();

      return articlesList;
    }
    else
    {
      throw("No news Found");
    }

   }catch(e){
    print(e.toString());
    throw e;
   }
  }


    Future<List<NewsModel>>getBrakingNews()async{
   
   try{
    Response response=await get(Uri.parse(braking_news_url));
    if(response.statusCode==200)
    {
      Map<String,dynamic> json=jsonDecode(response.body);

      List<dynamic>body=json['articles'];

      List<NewsModel>articlesList =body.map((item)=>NewsModel.fromJson(item)).toList();

      return articlesList;
    }
    else
    {
      throw("No news Found");
    }

   }catch(e){
    throw e;
   }
  }

}