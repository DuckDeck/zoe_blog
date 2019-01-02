import 'package:zoe_blog/redux/actions/home.dart';
import 'package:zoe_blog/redux/actions/main.dart';
import 'package:zoe_blog/redux/states/home.dart';
HomeState reducer(HomeState state,ActionType action){
  if(action is UpdateArticles){
    return state.copyWith(articles: action.payload);
  }
   if(action is UpdateAds){
    return state.copyWith(ads: action.payload);
  }
  return state;
}