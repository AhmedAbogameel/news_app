import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/helpers/constants.dart';
import 'package:news_app/providers/news_provider.dart';
import 'package:news_app/screens/all_news_screen.dart';
import 'package:news_app/screens/news_details_screen.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: kPrimaryColor));
  runApp(EntryPoint());
}

class EntryPoint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: NewsProvider(),
        ),
      ],
      child: CupertinoApp(
        home: AllNewsScreen(),
        debugShowCheckedModeBanner: false,
        title: 'Breaking News',
        theme: CupertinoThemeData.raw(
            Brightness.light,
            kPrimaryColor,
            kPrimaryColor,
            CupertinoTextThemeData(),
            kPrimaryColor,
            kWhiteColor,
        ),
        routes: {
          NewsDetailsScreen.routeName: (_) => NewsDetailsScreen(),
        },
      ),
    );
  }
}
