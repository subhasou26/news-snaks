//https://newsapi.org/v2/top-headlines?sources=google-news-in&apiKey=d0bfe87968a7431e9953cdbbaa889c54
import 'package:http/http.dart';
import 'dart:convert';
import 'dart:math';
import 'package:news_snack/model/newsArt.dart';
class apiOparation {


 static List sourceId=[
  "in",
  "us",
  "gb",
  "ca",
  "my",
  "nz",
  "ph",
  "sa",
  "sg",

 ];
 static Future<NewsArt> fetchnewscat(String quarry) async{
  final _random=new Random();
  var source=sourceId[_random.nextInt(sourceId.length)];
  Response response=await get(Uri.
  parse("https://newsapi.org/v2/top-headlines?country=$source&language=en&category=$quarry&apiKey=170411bcbc0c46daa4e8bd3d1f72e29a"));
  Map body_data=jsonDecode(response.body);
  var totalnumber=body_data["totalResults"];
  List articles=body_data["articles"];
  print("***********************************");
  final _Newrandom=new Random();
  var myArticle=articles[_Newrandom.nextInt(articles.length)];
  print(myArticle);
  print(totalnumber);
  print("***********************************");
  return NewsArt.fromAPItoApp(myArticle);
 }

 static Future<NewsArt> fetchnews() async{
  final _random=new Random();
  var source=sourceId[_random.nextInt(sourceId.length)];
  Response response=await get(Uri.
  parse("https://newsapi.org/v2/top-headlines?country=$source&language=en&apiKey=170411bcbc0c46daa4e8bd3d1f72e29a"));
  Map body_data=jsonDecode(response.body);
  var totalnumber=body_data["totalResults"];
  List articles=body_data["articles"];
  print("***********************************");
  final _Newrandom=new Random();
  var myArticle=articles[_Newrandom.nextInt(articles.length)];
  print(myArticle);
  print(totalnumber);
  print("***********************************");
  return NewsArt.fromAPItoApp(myArticle);
 }

}

