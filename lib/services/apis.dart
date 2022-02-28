 import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/articels.dart';
 class Api {
 static String apikey = "b58288abf70a4236847367e5cc589423";

 static fetchArticals () async {
    List<Articels>Articleslist=[];

  var url = Uri.parse("https://newsapi.org/v2/top-headlines?country=eg&apiKey=$apikey");
  var response = await http.get(url);
  var responsebody = jsonDecode(response.body)["articles"];
  print(responsebody);
   for ( var i in responsebody)
   {
    Articels x = Articels(
     description:i["description"],title:i["title"] ,url:i["url"] ,urlToImage:i["urlToImage"] );
    Articleslist.add(x);

   }
    return Articleslist ;
    }



 static fetchCategroy (String Categroy) async {
  List<Articels>Articleslist=[];

  var url = Uri.parse("https://newsapi.org/v2/top-headlines?country=eg&category=$Categroy&apiKey=$apikey");
  var response = await http.get(url);
  var responsebody = jsonDecode(response.body)["articles"];
  print(responsebody);
  for ( var i in responsebody)
  {
   Articels x = Articels(
       description:i["description"],title:i["title"] ,url:i["url"] ,urlToImage:i["urlToImage"] );
   Articleslist.add(x);

  }
  return Articleslist ;
 }
}