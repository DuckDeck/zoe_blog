import 'package:dio/dio.dart';
class User{
  int userId;
  String userImage;
  String realName;
  int articleCount;
  int commentCount;
  bool isAttention;
  String qq;
  String mobilePhone;
  String name;
  String email;
  int gender;
  String address;
  int birthday;

  User.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userImage = json['user_image_url'];
    realName = json['user_real_name'];
    articleCount =json["article_count"] ?? 0;
    isAttention =json["is_attention"] ?? false;
    commentCount =json["comment_count"] ?? 0;
    qq =json["user_qq"] ?? '';
    mobilePhone =json["user_phone"] ?? '';
    name =json["user_name"] ?? '';
    email =json["user_email"] ?? '';
    gender =json["user_gender"] ?? 0;
    address =json["user_address"] ?? '';
    birthday =json["user_birthday"] ?? 0;
  }

  static searchUser(String key,int index,int size) async{
    final url = "http://api.bqbbq.com/api/search/$key/article/$index/$size";
    final httpClient = Dio();
    final res = await httpClient.get(url);
    var map = res.data as Map<String,dynamic>;
    if(map["code"] != 0){
      // report error
      return;
    }
    print(map["data"]);

  }
}