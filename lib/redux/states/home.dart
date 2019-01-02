import 'package:flutter/foundation.dart';
import 'package:zoe_blog/model/ad.dart';
import 'package:zoe_blog/model/article.dart';
@immutable
class HomeState{
  final List<Ad> ads;
  final List<Article> articles;
  final bool loading;
  HomeState({this.ads,this.articles,this.loading});

  

  HomeState.initialState():ads=[],articles=[],loading=true;

  


}