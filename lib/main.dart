import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/helpers/constants.dart';
import 'package:news_app/providers/news_provider.dart';
import 'package:news_app/screens/all_news_screen.dart';
import 'package:news_app/screens/news_details_screen.dart';
import 'package:provider/provider.dart';

bool _released = false;

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: kPrimaryColor));
  runApp(DevicePreview(enabled: _released,builder: (_)=> EntryPoint()));}

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
debugShowCheckedModeBanner: _released,
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