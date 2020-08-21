import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:news_app/helpers/constants.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/screens/news_details_screen.dart';
import 'package:news_app/widgets/chip.dart';

class BigCard extends StatelessWidget {
  final String publishAt;
  final String title;
  final String urlToImage;
  final NewsModel newsModel;
  BigCard({this.title, this.publishAt, this.urlToImage,this.newsModel});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      child: Container(
        height: (size.height - CupertinoNavigationBar().preferredSize.height) / 2.5,
        margin: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Hero(
                    tag: title,
                    child: urlToImage != null ? ClipRRect(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                      child: Image.network(
                        urlToImage,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (_,exception,stackTrace)=> Icon(Icons.image,size: 100,),
                        loadingBuilder: (_,child,loading){
                          if(loading == null){
                            return child;
                          }
                          return Center(child: CupertinoActivityIndicator(),);
                        },
                      ),
                    ) : Icon(Icons.image,size: 100,),
                  ),
                ),
                Container(
                  height: size.height / 15,
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(8),
                  child: Text(title,textAlign: TextAlign.center,style: TextStyle(color: kWhiteColor),),
                  decoration: BoxDecoration(
                    color: kPrimaryColor.withOpacity(0.8),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                  ),
                ),
              ],
            ),
            Positioned(
              top: size.width / 200,
              right: size.width / 80,
              child: CustomChip(
                title: publishAt,
                icon: Icons.public,
              ),
//              child: Card(
//                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//                child: Padding(
//                  padding: const EdgeInsets.all(5.0),
//                  child: Row(
//                    children: [
//                      Text(
//                        publishAt,
//                        style: TextStyle(color: kBlackColor),
//                      ),
//                      Icon(Icons.public,color: kPrimaryColor,)
//                    ],
//                  ),
//                ),
//              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: kBlackColor.withOpacity(0.5),
                  blurRadius: 5,
                  spreadRadius: 1)
            ]),
      ),
      onTap: ()=> Navigator.pushNamed(context, NewsDetailsScreen.routeName,arguments: newsModel),
    );
  }
}
