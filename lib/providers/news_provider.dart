import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/news_model.dart';

class NewsProvider with ChangeNotifier {
  List<NewsModel> allNews = [];

  Future<List<NewsModel>> fetchNews()async{
    String url = 'http://newsapi.org/v2/everything?q=apple&from=2020-08-19&to=2020-08-19&sortBy=popularity&apiKey=df1a070b89e64ce78ba286cea86af31b';
    final response = await http.get(url);
    if(response.statusCode == 200){
      var decodedNews = jsonDecode(response.body)['articles'] as List;
      decodedNews.forEach((element) {
        var model = NewsModel.fromMap(element);
        if(allNews.contains(model.title)){
          allNews.remove(model);
        }else {
          allNews.add(model);
        }
      });
      notifyListeners();
      return allNews;
    }else{
      throw Exception('Sorry can\'t load right now');
    }
  }

}