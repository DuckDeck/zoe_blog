import 'package:flutter/material.dart';
import 'package:zoe_blog/tool/tool.dart';
import 'package:zoe_blog/model/article.dart';
import 'package:zoe_blog/widgets/tag.dart';
import 'package:zoe_blog/tool/constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
class ArticleView extends StatelessWidget {
  final Article vm;

  const ArticleView({Key key, this.vm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          color: Colors.white,
          margin: EdgeInsets.only(bottom: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 20.0,
                      backgroundImage: NetworkImage(vm.userInfo.userImage),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  vm.userInfo.readlName,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                               
                              ],
                            ),
                            Text(
                              Tool.readTimestamp(vm.releaseTime),
                              style: Theme.of(context).textTheme.caption,
                            )
                          ],
                        ),
                      ),
                    ),
                    Tag(text: vm.sortName ?? "",   border: true,color: Colors.cyan)
                  ],
                ),
              ),
              vm.name.isEmpty
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        vm.name,
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.display1,
                      ),
                    ),
              Padding(padding: const EdgeInsets.symmetric(vertical: 8.0),
                child:CachedNetworkImage(imageUrl: vm.mainImg,),
              ),      
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  vm.brief,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.body1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.remove_red_eye,color: Colors.cyan, size: 16,),
                    Text(vm.clickNum.toString()),
                    SizedBox(width: 6,),
                    Icon(Icons.comment,color: Colors.cyan, size: 16),
                    Text(vm.commentCount.toString()),
                    SizedBox(width: 6,),
                    Icon(Icons.memory,color: Colors.cyan, size: 16),  //不知道为什么心没有
                    Text(vm.likeCount.toString()),
                  ],
                ),
              ),
              Container(
                child: _buildContent(context),
              ),
              Divider(
                height: 1.0,
              ),
            
            ],
          ),
        ),
        
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    Widget child = Container();
      GestureDetector(
        onTap: () {
          
        },
        child: Hero(
          tag: vm.mainImg,
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: FadeInImage(
              image: NetworkImage(vm.mainImg),
              fit: BoxFit.cover,
              placeholder: AssetImage(
                "assets/images/placeholder.png",
              ),
            ),
          ),
        ),
      );
      
    
    return Container(
      child: child,
    );
  }
}
