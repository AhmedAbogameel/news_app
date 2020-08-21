import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:news_app/models/news_model.dart';

class NewsDetailsScreen extends StatelessWidget {
  static const String routeName = '/news_details_screen';
  @override
  Widget build(BuildContext context) {
    final newsModel = ModalRoute.of(context).settings.arguments as NewsModel;
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Breaking News'),
        backgroundColor: Colors.transparent,
        border: Border.all(color: Colors.transparent),
        actionsForegroundColor: Colors.red[900],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Card(
                color: Colors.red[900].withOpacity(0.7),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    newsModel.title,
                    style: TextStyle(fontSize: 25,color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Hero(
                tag: newsModel.title,
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      newsModel.urlToImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  buildChip(newsModel.author, Icons.edit),
                  SizedBox(
                    width: 15,
                  ),
                  buildChip(newsModel.publishedAt, Icons.public),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Expanded(
                child: Card(
                  color: Colors.red[900].withOpacity(0.2),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Center(
                      child: Text(
                        newsModel.description,
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildChip(title, icon) {
    return Card(
      elevation: 5,
      shadowColor: Colors.red[900],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 3.0),
              child: Icon(
                icon,
                color: Colors.red[900],
                size: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}