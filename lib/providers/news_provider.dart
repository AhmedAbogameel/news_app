import 'dart:convert';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/news_model.dart';

const List<String> _fakeAPIs =const [
  'http://newsapi.org/v2/everything?q=bitcoin&from=2020-07-21&sortBy=publishedAt&apiKey=df1a070b89e64ce78ba286cea86af31b',
  'http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=df1a070b89e64ce78ba286cea86af31b',
  'http://newsapi.org/v2/everything?q=apple&from=2020-08-20&to=2020-08-20&sortBy=popularity&apiKey=df1a070b89e64ce78ba286cea86af31b',
  'http://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=df1a070b89e64ce78ba286cea86af31b',
  'http://newsapi.org/v2/everything?domains=wsj.com&apiKey=df1a070b89e64ce78ba286cea86af31b',
];

class NewsProvider with ChangeNotifier {
  List<NewsModel> allNews = [];

  Future<List<NewsModel>> fetchNews()async{
    int _randomAPI = Random().nextInt(_fakeAPIs.length);
    print(_randomAPI);
    String url = _fakeAPIs[_randomAPI];
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