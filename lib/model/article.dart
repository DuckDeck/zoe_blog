import 'tag.dart';
import 'user.dart';
import 'dart:async';
import 'package:zoe_blog/redux/view_modules/viewModel.dart';
import 'package:dio/dio.dart';
import 'package:zoe_blog/model/ad.dart';
import 'package:zoe_blog/redux/actions/home.dart';
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
    mainImg = json[""];
    name = json[""];
    releaseTime = json[""];
    sortId = json[""];
    sortName = json[""];
    commentCount = json[""];
    likeCount = json[""];
    tags = [];
    for(final item in json["tags"]){
      final tag = Tag.fromJson(item);
      tags.add(tag);
    }
    userInfo = User.fromJson(json["userInfo"]);
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
    StoreContainer.global.dispatch(UpdateAds(payload: ads));
    StoreContainer.global.dispatch(UpdateArticles(payload: articles));
  }



}