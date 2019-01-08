import 'package:flutter/foundation.dart';
import 'package:zoe_blog/model/ad.dart';
import 'package:zoe_blog/model/article.dart';
@immutable
class HomeState{
  final List<Ad> ads;
  final List<Article> articles;
  final bool isLoading;
  final bool isLoadingMore;
  HomeState({this.ads,this.articles,this.isLoading,this.isLoadingMore});

  HomeState copyWith({List<Ad> ads,List<Article> articles,bool loading,bool loadingMore}){
    return HomeState(articles: articles ?? this.articles,ads: ads ?? this.ads,isLoading: loading ?? this.isLoading,isLoadingMore: loadingMore ?? this.isLoadingMore);
  }

  HomeState.initialState():ads=[],articles=[],isLoading=true,isLoadingMore = false;
  
}