import 'package:flutter/material.dart';
import 'package:zoe_blog/model/result.dart';
import 'package:zoe_blog/model/user.dart';
import 'package:zoe_blog/model/article.dart';
import 'package:zoe_blog/widgets/author_article_info.dart';
import 'package:zoe_blog/model/tag.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
class ArticlePage extends StatefulWidget {
   final int articleId;
   ArticlePage(this.articleId);
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  Result result;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initData();
  }

  void initData() async {
     final res  =await Article.getArticle(widget.articleId);
      setState(() {
        result = res;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: (result ==null)?Center(child: CircularProgressIndicator(),):Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          color: Colors.white,
          margin: EdgeInsets.only(bottom: 8.0),
           child: Column(
              children: <Widget>[
                 
                 Text((result.data as Article).name,style: TextStyle(fontSize: 20.0),),
                 AuthorArticleInfoView((result.data as Article).userInfo),
                 //Wrap(children: createTag((result.data as Article).tags)),
                // WebviewScaffold(url: Uri.dataFromString('<html>'+(result.data as Article).content+'</html>',mimeType: "text/html").toString())
                //  <span style=\"font-family: Helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, sans-serif;\">这些年，人，却发现完全不是这样。然后忍不住吐槽，“妈的，都是“照骗”！，比如我。</span>
                //WebviewScaffold(url: Uri.dataFromString("12313123",mimeType: "text/html").toString())
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