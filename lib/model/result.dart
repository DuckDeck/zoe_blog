class Result{
  int code;
  String msg;
  String cmsg;
  dynamic data;
  int count;

  Result({this.code,this.msg,this.cmsg,this.count,this.data});

  Result.fromData(Map<String, dynamic> resData){
    code = resData["code"];
    msg = resData["msg"];
    cmsg = resData["cMsg"];
    data = resData["data"];
    count = resData["count"];
  }
}