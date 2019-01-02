import 'package:flutter/material.dart';

import 'package:zoe_blog/model/article.dart';
import 'package:zoe_blog/widgets/tag.dart';
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
                              vm.releaseTime.toString(),
                              style: Theme.of(context).textTheme.caption,
                            )
                          ],
                        ),
                      ),
                    )
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  vm.brief,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.body1,
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
