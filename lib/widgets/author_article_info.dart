import 'package:flutter/material.dart';
import 'package:zoe_blog/model/user.dart';
import 'package:zoe_blog/tool/tool.dart';
class AuthorArticleInfoView extends StatelessWidget {
  
  final User user;
  int releaseTime;
  int readCount;
  AuthorArticleInfoView(this.user,this.releaseTime,this.readCount);
  
  

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Row(
        children: <Widget>[
           CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage(user.userImage),
            ),
           Column(
             crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(children: <Widget>[
                Text("作者"),
                Text(user.realName)
              ],),
              Row(children: <Widget>[
                Text("发布于"),
                Text(Tool.readTimestamp(releaseTime)),

                Text("浏览"),
                Text(readCount.toString())

              ],)
              
            ],
          ),
          OutlineButton(child: Text("关注"),onPressed: (){},)
        ],
      )
    );
  }
}