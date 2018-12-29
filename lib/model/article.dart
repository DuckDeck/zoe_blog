import 'tag.dart';
import 'user.dart';
class Article{
  int articleId;
  int createTime;
  String brief;
  int clickNum;
  String mainImg;
  String name;
  int releaseTime;
  int sortId ;
  String sortName;
  int commentCount;
  int likeCount;
  List<Tag> tags;
  User userInfo;
}