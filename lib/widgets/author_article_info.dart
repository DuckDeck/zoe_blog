import 'package:flutter/material.dart';
import 'package:zoe_blog/model/user.dart';
class AuthorArticleInfoView extends StatelessWidget {
  
  final User user;

  AuthorArticleInfoView(this.user);
  
  

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
            children: <Widget>[
              Row(children: <Widget>[
                Text("作者"),
                Text(user.realName)
              ],)
              //  RichText(text: TextSpan(
              //    children: <TextSpan>[
              //      TextSpan(text: "作者"),
              //      TextSpan(text: user.readlName)
              //    ]
              //  ),),
              //  RichText(text: TextSpan(
              //    children: <TextSpan>[
              //      TextSpan(text: "发布于"),
              //      TextSpan(text: '12313123'),
              //      TextSpan(text: "文章"),
              //      TextSpan(text: '123123'),
              //      TextSpan(text: "阅读"),
              //      TextSpan(text: '123123')
              //    ]
              //  ),)
            ],
          ),
          OutlineButton(child: Text("关注"),onPressed: (){},)
        ],
      )
    );
  }
}