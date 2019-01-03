import 'package:flutter/foundation.dart';
import 'package:zoe_blog/model/ad.dart';
import 'package:zoe_blog/model/article.dart';
@immutable
class HomeState{
  final List<Ad> ads;
  final List<Article> articles;
  final bool isLoading;
  HomeState({this.ads,this.articles,this.isLoading});

  HomeState copyWith({List<Ad> ads,List<Article> articles,bool loading}){
    return HomeState(articles: articles ?? this.articles,ads: ads ?? this.ads,isLoading: loading ?? this.isLoading);
  }

  HomeState.initialState():ads=[],articles=[],isLoading=true;

  


}