import 'dart:convert';

class Result{
  int code;
  String msg;
  String cmsg;
  dynamic data;
  int count;

  Result({this.code,this.msg,this.cmsg,this.count,this.data});

  Result.fromData(String data){
    final js = json.decode(data);
    code = js["code"];
    msg = js["msg"];
    cmsg = js["cMsg"];
    data = js["data"];
    count = js["count"];
  }
}