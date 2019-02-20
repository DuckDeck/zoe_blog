import 'package:flutter/material.dart';
import 'package:zoe_blog/model/result.dart';
import 'package:zoe_blog/widgets/author_article_info.dart';
import 'package:zoe_blog/model/tag.dart';
class ArticlePage extends StatefulWidget {
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  Result result;

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: (result ==null)?Center(child: CircularProgressIndicator(),):Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          color: Colors.white,
          margin: EdgeInsets.only(bottom: 8.0),
           child: Row(
              children: <Widget>[
                 Text("文章标题"),
                 AuthorArticleInfoView(result.data["user"]),
                 Wrap(children: createTag(result.data["tags"]),),
                  
              ],
           ),
        ),
      ),
    );
  }

  List<Widget> createTag(List<Tag> tags) {
    final tagViews = List<Widget>();
    return tagViews;
  }
}