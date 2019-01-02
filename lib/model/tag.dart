class Tag{
  int tagId;
  String tagName; 
  Tag.fromJson(Map<String, dynamic> json) {
    tagId = json['tag_id'];
    tagName = json['tag_name'];
  }
}