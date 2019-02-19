import 'package:flutter/material.dart';
import 'package:zoe_blog/model/article.dart';
import 'package:zoe_blog/widgets/search_bar.dart';
import 'package:zoe_blog/model/result.dart';
import 'package:zoe_blog/widgets/home_banner.dart';
import 'package:zoe_blog/widgets/home_article.dart';
import 'package:zoe_blog/pages/search.dart';
import 'package:fluttertoast/fluttertoast.dart';
class HomePage extends StatefulWidget{
  @override
    State<StatefulWidget> createState() =>_HomePageSate();
}
class _HomePageSate extends State<HomePage>{
  ScrollController _controller = new ScrollController(); 
  int loadMore = 0; //  1 正常 2 加载更多 
  Result result;
  @override
    void initState() {
      super.initState();
      initData();
      _controller.addListener((){
        print(_controller.offset);
       if (_controller.position.pixels ==
          _controller.position.maxScrollExtent) {
            loadMore =  2;
          print('滑动到了最底部');
          //Article.getHomeArticles((vm.articles.length ~/ 10), 10);
       }
      });
    }

    @override
      Widget build(BuildContext context) {
        // TODO: implement build
        return Scaffold(backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0.0,
            title: GestureDetector(child: SearchBar(enabled: false,),
             onTap: (){
               Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SearchPage()));
             },
        ),
      ),
      body: 
       Container(
            child: (result ==null)?Center(child: CircularProgressIndicator(),):Container(
              child: ListView(
                controller: _controller,
                children: <Widget>[
                  Padding(padding: const EdgeInsets.all(8.0),child: result.data["ad"].isNotEmpty ? HomeBanner(banners: result.data["ad"],) : Container()),
                  Container(height: 8,color: Colors.grey[100],),
                  result.data["article"].isNotEmpty ? ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: result.data["article"].length + 1,
                    itemBuilder: (context,index){
                      if(index < result.data["article"].length){
                        return ArticleView(vm: result.data["article"][index]);
                      }
                      return _getMoreWidget();
                    },
                  ):Container()
                ],
              )
            )
       )
      );
        
      }

   void initData() async {
     final res  = await Article.getHomeData();
     if(res.code !=0 ){
       Fluttertoast.showToast(msg: res.cmsg,toastLength:Toast.LENGTH_SHORT,gravity: ToastGravity.BOTTOM);
       return;
     }
     
     setState(() {
       result =res;
     });
   }
  
    Widget _getMoreWidget() {
      if(loadMore == 1){
        return null;
      }
      else{
        return Center(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  loadMore == 1 ? '已经到底了': '加载中...     ',
                  style: TextStyle(fontSize: 16.0),
                ),
                loadMore == 1 ? null : CircularProgressIndicator(strokeWidth: 1.0,)
              ],
            ),
          ),
       );
      }
     
    }
  }