import 'tag.dart';
import 'user.dart';

import 'package:dio/dio.dart';
import 'package:zoe_blog/model/ad.dart';

class Article{
  int articleId;
  int createTime;
  String brief;
  int clickNum;
  String mainImg;
  String name;
  int releaseTime;
  int sortId ;
  String sortName;
  int commentCount;
  int likeCount;
  List<Tag> tags;
  User userInfo;


  Article.fromJson(Map<String, dynamic> json) {
    articleId = json['article_id'];
    createTime = json['article_create_time'];
    brief = json['article_brief'];
    clickNum = json['article_click'];
    mainImg = json["article_main_img"];
    name = json["article_name"];
    releaseTime = json["article_release_time"];
    sortId = json["article_sort_id"];
    sortName = json["article_sort_name"];
    commentCount = json["comment_count"];
    likeCount = json["like_count"];
    tags = [];
    if(json.containsKey("tags")){
      for(final item in json["tags"]){
        final tag = Tag.fromJson(item);
        tags.add(tag);
      }
    }
    if(json.containsKey("userInfo")){
      userInfo = User.fromJson(json["userInfo"]);
    }
    
  }

  static getHomeData() async {
    final url = "http://api.bqbbq.com/api/index";
    final httpClient = Dio();
    final res = await httpClient.get(url);
    var map = res.data as Map<String,dynamic>;
    if(map["code"] != 0){
      // report error
      return;
    }
    print(map["data"]);
    map = map["data"];
    //var map = json.decode(s); //所以这里的问题就是如果出现错误不知道 怎么搞，目前用的这个redux好像不支持，直接取出数据来了
    List<Ad> ads = [];
    List<Article> articles = [];
    for(var item in map["top"]){
      final ad = Ad.fromJson(item);
      
      ads.add(ad);
    }
    for(var item in map["articles"]){
      final article = Article.fromJson(item);
      articles.add(article);
    }
    
  }


  static getHomeArticles(int index, int size) async{
   
    final url = "http://api.bqbbq.com/api/index/$index/$size";
    final httpClient = Dio();
    final res = await httpClient.get(url);
    var map = res.data as Map<String,dynamic>;
    if(map["code"] != 0){
      // report error
      return;
    }
    print(map["data"]);
    //var map = json.decode(s); //所以这里的问题就是如果出现错误不知道 怎么搞，目前用的这个redux好像不支持，直接取出数据来了
 
    List<Article> articles = [];
   
    for(var item in map["data"]){
      final article = Article.fromJson(item);
      articles.add(article);
    }
    
    
}

  static searchArticle(String key,int index,int size) async{
    final url = "http://api.bqbbq.com/api/search/$key/article/$index/$size";
    final httpClient = Dio();
    final res = await httpClient.get(url);
    var map = res.data as Map<String,dynamic>;
    if(map["code"] != 0){
      // report error
      return;
    }
    print(map["data"]);
  }

  


  

}