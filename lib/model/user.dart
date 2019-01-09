import 'package:dio/dio.dart';
class User{
  int userId;
  String userImage;
  String readlName;
  User.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userImage = json['user_image_url'];
    readlName = json['user_real_name'];
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