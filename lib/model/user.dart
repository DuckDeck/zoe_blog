class User{
  int userId;
  String userImage;
  String readlName;
  User.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userImage = json['user_image_url'];
    readlName = json['user_real_name'];
  }
}