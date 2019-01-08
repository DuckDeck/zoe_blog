import 'package:flutter/foundation.dart';
import 'package:zoe_blog/model/article.dart';
import 'package:zoe_blog/model/user.dart';
@immutable
class SearchStates{
  final String key;
  final List<Article> articles;
  final bool isLoading;
  final int loadingMoreStatus; //加载更多状态，0 为正常，1 为加载更多，2为已经到底，没有更多数据
  final List<User> users;

  SearchStates({this.key,this.articles,this.isLoading,this.loadingMoreStatus,this.users});

  SearchStates copyWith({String key,List<Article> articles,bool loading,int loadingMore,List<User> users}){
    return SearchStates(articles: articles ?? this.articles,
    key: key ?? this.key,
    isLoading: loading ?? this.isLoading,
    loadingMoreStatus: loadingMore ?? this.loadingMoreStatus,
    users: users ?? this.users);
  }

  SearchStates.initialState() : users=[],articles=[],isLoading=true,loadingMoreStatus = 0,key="";
  
}