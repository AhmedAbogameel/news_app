import 'package:intl/intl.dart';

class NewsModel {

  String _title;
  String _publishedAt;
  String _description;
  String _author;
  String _urlToImage;

  String get title => _title;
  String get publishedAt => _publishedAt;
  String get description => _description;
  String get author => _author;
  String get urlToImage => _urlToImage;

  NewsModel(Map json){
    _title = json['title'];
    _author = json['author'];
    _description = json['description'];
    _publishedAt = json['publishedAt'];
    _urlToImage = json['urlToImage'];
  }

  NewsModel.fromMap(Map json){
    _title = json['title'];
    _author = json['author'];
    _description = json['description'];
    _publishedAt = DateFormat.yMMM().format(DateTime.parse(json['publishedAt'])).toString();
    _urlToImage = json['urlToImage'];
  }
}