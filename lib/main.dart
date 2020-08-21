import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/providers/news_provider.dart';
import 'package:news_app/screens/all_news_screen.dart';
import 'package:news_app/screens/news_details_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(EntryPoint());

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
//        theme: CupertinoThemeData.raw(
//          Brightness.dark,
//          Colors.black,
//          Colors.black,
//          CupertinoTextThemeData(),
//          Colors.teal,
//          Colors.white,
//        ),
        routes: {
          NewsDetailsScreen.routeName: (_) => NewsDetailsScreen(),
        },
      ),
    );
  }
}
// df1a070b89e64ce78ba286cea86af31b
