import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/services/apis.dart';
import 'package:news_app/services/fun.dart';
import 'package:news_app/view/wedigets/categorybutton.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGround,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: 10.0,
                right: 10.0,
                bottom: 10.0,
                top: MediaQuery.of(context).size.height / 14),
            child: Center(
              child: Text(
                "Chose News category",
                style: TextStyle(fontSize: fontbigger, color: textColor),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: MediaQuery.of(context).size.height / 14,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CatrgroyButton(
                    buttoncolor: red,
                    textcategroy: "General",
                  ),
                  CatrgroyButton(
                    buttoncolor: orangeDark,
                    textcategroy: "Sport",
                  ),
                  CatrgroyButton(
                    buttoncolor: blue,
                    textcategroy: "Business",
                  ),
                  CatrgroyButton(
                    buttoncolor: green,
                    textcategroy: "Science",
                  ),
                  CatrgroyButton(
                    buttoncolor: yellow,
                    textcategroy: "Health",
                  ),
                  CatrgroyButton(
                    buttoncolor: white,
                    textcategroy: "Technology",
                  ),
                  CatrgroyButton(
                    buttoncolor: red,
                    textcategroy: "Entertainment",
                  ),
                ],
              ),
            ),
          ),
                   Padding(
                      padding: const EdgeInsets.all(7.0),
                    child: Container(
                       height: 28,
                      child: Text("Best News",
                      style: TextStyle(fontSize: fontxlarg, color: textColor)),
            ),
          ),
                    Expanded(
                     child: FutureBuilder(
                       future: Api.fetchArticals(),
                       builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                         if (snapshot.hasData)
                         {
                           return ListView.builder(
                             itemCount: snapshot.data.length,
                             itemBuilder: (BuildContext context, int index)

                             {
                               return GestureDetector(
                                 onTap:(){
                                 Fun.openlink(snapshot.data[index].url);},

                                 child: Card(
                                   color: white,
                                   shape: RoundedRectangleBorder(
                                       borderRadius: BorderRadius.circular(30)),
                                   elevation: 5,
                                   shadowColor: orangeDark,
                                   child: Column(
                                     children: [
                                       Container(
                                         height: 250,
                                         decoration: BoxDecoration(
                                           borderRadius: BorderRadius.only(
                                               topLeft: Radius.circular(30),
                                               topRight: Radius.circular(30)),
                                           image: DecorationImage(
                                               image: NetworkImage(
                                                   "${snapshot.data[index].urlToImage}"),
                                               fit: BoxFit.cover),
                                         ),
                                       ),
                                       Container(
                                         alignment: Alignment.topCenter,
                                         width: MediaQuery.of(context).size.width * 0.90,
                                         child: Text(
                                           "${snapshot.data[index].title} ", style: TextStyle(
                                             fontSize: fontlarge,fontWeight: FontWeight.w600,color: textColor
                                         ),
                                           textAlign: TextAlign.center,
                                         ),
                                       ),
                                       Container(
                                         height: 40,
                                         child: Row(
                                           children: [
                                             IconButton(
                                                 onPressed: () {
                                                   Fun.sharelink(snapshot.data[index].url);
                                                 },
                                                 icon: Icon(Icons.share)),
                                             IconButton(
                                                 onPressed: () {
                                                   Fun.copiedlink(snapshot.data[index].url).then((value)
                                                   {
                                                    final snackBar =SnackBar(content: Text("Linked Copied"),);
                                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                                   });
                                                 },
                                                 icon: Icon(Icons.copy)),
                                           ],
                                         ),
                                       ),
                                     ],
                                   ),
                                 ),
                               );
                             },);
                         }
                         else
                           {
                             return Center(child: CircularProgressIndicator());
                           }
                     },
                     ),
            ),
        ],
      ),
    );
  }
}
