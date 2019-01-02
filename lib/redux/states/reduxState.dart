import 'package:flutter/foundation.dart';
import 'package:zoe_blog/redux/states/home.dart';
@immutable
class ReduxState{
  final HomeState home;

  const ReduxState({this.home});
}