import 'package:flutter/foundation.dart';
import 'package:zoe_blog/model/ad.dart';
import 'package:zoe_blog/model/article.dart';
@immutable
class HomeState{
  final List<Ad> ads;
  final List<Article> articles;
  final bool isLoading;
  final int loadingMoreStatus; //加载更多状态，0 为正常，1 为加载更多，2为已经到底，没有更多数据
  HomeState({this.ads,this.articles,this.isLoading,this.loadingMoreStatus});

  HomeState copyWith({List<Ad> ads,List<Article> articles,bool loading,int loadingMore}){
    return HomeState(articles: articles ?? this.articles,
    ads: ads ?? this.ads,
    isLoading: loading ?? this.isLoading,
    loadingMoreStatus: loadingMore ?? this.loadingMoreStatus);
  }

  HomeState.initialState():ads=[],articles=[],isLoading=true,loadingMoreStatus = 0;
  
}