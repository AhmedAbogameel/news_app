import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/helpers/constants.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/widgets/chip.dart';

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
        brightness: Brightness.light,
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Expanded(
                child: Card(
                  color: kPrimaryColor.withOpacity(0.7),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Text(
                        newsModel.title,
                        style: TextStyle(fontSize: 25,color: kWhiteColor),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Hero(
                  tag: newsModel.title,
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: newsModel.urlToImage == null ? Icon(Icons.image,size: 150,) : Image.network(
                        newsModel.urlToImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              FittedBox(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomChip(title: newsModel.author,icon: Icons.edit),
                    SizedBox(
                      width: 15,
                    ),
                    CustomChip(title: newsModel.publishedAt,icon: Icons.public),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Expanded(
                flex: 2,
                child: Card(
                  color: kPrimaryColor.withOpacity(0.2),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Center(
                      child: SingleChildScrollView(
                        child: Text(
                          newsModel.description,
                          style: TextStyle(fontSize: 22),
                        ),
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
}
