import 'package:zoe_blog/model/article.dart';
import 'package:zoe_blog/model/ad.dart';
import 'package:zoe_blog/redux/actions/main.dart';
class UpdateAds extends ActionType {
  final List<Ad> payload;
  UpdateAds({this.payload}) : super(payload: payload);
}

class UpdateArticles extends ActionType {
  final List<Article> payload;
  UpdateArticles({this.payload}) : super(payload: payload);
}

class AddArticles extends ActionType{
    final List<Article> payload;
    AddArticles({this.payload}) : super(payload: payload);
}


