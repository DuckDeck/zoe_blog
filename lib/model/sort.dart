import 'package:dio/dio.dart';

class Sort{
  int sortId;
  String sortName;

  Sort({this.sortId,this.sortName});

  static searchSort(String key,int index,int size) async{
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