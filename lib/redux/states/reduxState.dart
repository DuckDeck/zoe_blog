import 'package:flutter/foundation.dart';
import 'package:zoe_blog/redux/states/home.dart';
import 'package:zoe_blog/redux/states/search.dart';
@immutable
class ReduxState{
  final HomeState home;
  final SearchStates search;
  const ReduxState({this.home,this.search});
}