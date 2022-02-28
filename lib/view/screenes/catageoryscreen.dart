import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/services/apis.dart';
import 'package:news_app/services/fun.dart';

class CatageroyScreen extends StatefulWidget {
  String textcategroy ;

  CatageroyScreen(this.textcategroy);

  @override
  _CatageroyScreenState createState() => _CatageroyScreenState();
}

class _CatageroyScreenState extends State<CatageroyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGround,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
        [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextButton.icon(onPressed: (){
                Navigator.pop(context);
              }, icon: Icon(Icons.arrow_back_ios),
                label: Text("${widget.textcategroy} :",
                  style: TextStyle(fontSize: fontxlarg, color: textColor)),)
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FutureBuilder(
                future: Api.fetchCategroy("${widget.textcategroy.toLowerCase()}"),
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
          )
        ],
      ),
    );
  }
}
