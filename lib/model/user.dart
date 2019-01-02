class User{
  int userId;
  int userImage;
  String readName;
  User.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userImage = json['user_image_url'];
    readName = json['user_real_name'];
  }
}