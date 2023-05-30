import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/helpers/constants.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/providers/news_provider.dart';
import 'package:news_app/widgets/big_card.dart';
import 'package:provider/provider.dart';

class AllNewsScreen extends StatelessWidget {
  static const String routeName = '/all_news_screen';
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(
            'Home',
            style: TextStyle(color: kWhiteColor),
          ),
          backgroundColor: kPrimaryColor,
          brightness: Brightness.dark,
        ),
        child: Consumer<NewsProvider>(
          builder: (ctx, provider, child) {
            final Future<List<NewsModel>> future = provider.fetchNews();
            return SafeArea(
              child: FutureBuilder<List<NewsModel>>(
                future: future,
                builder: (ctx, snapshot) => snapshot.hasData
                    ? ListView.builder(
                        itemCount: snapshot.data.length,
                        padding: const EdgeInsets.all(8.0),
                        itemBuilder: (ctx, index) {
                          NewsModel newsModel = snapshot.data[index];
                          return BigCard(
                            title: newsModel.title,
                            publishAt: newsModel.publishedAt,
                            urlToImage: newsModel.urlToImage,
                            newsModel: newsModel,
                          );
                        })
                    : Center(
                        child: CupertinoActivityIndicator(),
                      ),
              ),
            );
          },
        ));
  }
}
