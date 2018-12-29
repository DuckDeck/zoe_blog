class Ad{
  int adId;
  String name;
  String brief;
  String mainImg;
  Ad({this.adId,this.name,this.brief,this.mainImg});
  Ad.fromJson(Map<String, dynamic> json) {
    adId = json['article_id'];
    name = json['article_name'];
    brief = json['article_brief'];
    mainImg = json['article_main_img'];
  }
}