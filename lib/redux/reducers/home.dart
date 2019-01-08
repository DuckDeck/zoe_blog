import 'package:zoe_blog/redux/actions/home.dart';
import 'package:zoe_blog/redux/actions/main.dart';
import 'package:zoe_blog/redux/states/home.dart';
HomeState reducer(HomeState state,ActionType action){
  if(action is UpdateArticles){
    return state.copyWith(articles: action.payload,loading:false);
  }
   if(action is UpdateAds){
    return state.copyWith(ads: action.payload);
  }
  if (action is AddArticles){
    final origin = state.articles;
    origin.addAll(action.payload);
    return state.copyWith(articles: origin,loadingMore: 0);
  }
  if (action is LoadMoreStatus){
    return state.copyWith(loadingMore: action.payload);
  }
  return state;
}