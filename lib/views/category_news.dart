import 'package:agookyaa/helper/news.dart';
import 'package:agookyaa/models/article_model.dart';
import 'package:agookyaa/views/article_view.dart';
import 'package:flutter/material.dart';

class CategoryNews extends StatefulWidget {
  

  final String category;
  const CategoryNews({super.key, required this.category});

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {

  List<ArticleModel> articles = [];
  // ignore: unused_field
  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getCategoryNews();
  }

    getCategoryNews() async {
    CategoryNewsClass newsClass = CategoryNewsClass();
    await newsClass.getNews(widget.category);
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Agokya"),
            Text("News", style: TextStyle(
              color: Colors.blue
            ),)
          ],
        ),
        actions: <Widget>[
          Opacity(
            opacity: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16)
              ,child: const Icon(Icons.save)),
          )
        ],
        centerTitle: true,
        elevation: 0.0,
      ),
      // ignore: avoid_unnecessary_containers
      body:_loading ? Center(
        // ignore: avoid_unnecessary_containers
        child: Container(
          child: const CircularProgressIndicator(),
        ),
      ) : SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: <Widget>[
                 ///Blogs
                // ignore: avoid_unnecessary_containers
                Container(
                  padding: const EdgeInsets.only(top: 16),
                  child: ListView.builder(
                    itemCount: articles.length,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (context, index){
                      return BlogTile(
                        imageUrl: articles[index].urlToImage,
                        title: articles[index].title,
                        desc: articles[index].description,
                        url: articles[index].url,
                      );  
                      }),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {

  // ignore: prefer_typing_uninitialized_variables
  final imageUrl, title, desc, url;
  // ignore: empty_constructor_bodies
  const BlogTile({super.key, @required this.imageUrl, @required this.title, @required this.desc, @required this.url});

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => ArticleView(
            blogUrl: url,
          )
        ));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
                child: Image.network(imageUrl)
            ),
            const SizedBox(height: 8,),
            Text(title,style: const TextStyle(
              fontSize: 18,
              color: Colors.black87,
              fontWeight: FontWeight.w500
            ),),
            const SizedBox(height: 8,),
            Text(desc, style: const TextStyle(
              color: Colors.black54
            ),),
          ],
        ),
      ),
    );
  }
}