import 'dart:convert';
import 'package:agookyaa/models/article_model.dart';
import 'package:http/http.dart' as http;

class News{
  List<ArticleModel> news = [];

  Future<void> getNews() async{
String url= "https://newsapi.org/v2/top-headlines?country=us&apiKey=369ae1cd63424882bb8cfb3419a134bb";
  var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){

        if(element["urlToImage"] != null && element["description"] != null){

          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['context']
          );

          news.add(articleModel);

        }
      });   
    }
  } 
}

class CategoryNewsClass{
  List<ArticleModel> news = [];

  Future<void> getNews(String category) async{
String url= "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=369ae1cd63424882bb8cfb3419a134bb";
  var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){

        if(element["urlToImage"] != null && element["description"] != null){

          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['context']
          );

          news.add(articleModel);

        }
      });   
    }
  } 
}
