import 'package:flutter/material.dart';
import 'package:zoe_blog/model/article.dart';
import 'package:zoe_blog/widgets/search_bar.dart';

import 'package:zoe_blog/widgets/home_banner.dart';
import 'package:zoe_blog/widgets/home_article.dart';
import 'package:zoe_blog/pages/search.dart';
class HomePage extends StatefulWidget{
  @override
    State<StatefulWidget> createState() =>_HomePageSate();
}
class _HomePageSate extends State<HomePage>{
  ScrollController _controller = new ScrollController(); 

  @override
    void initState() {
      // TODO: implement initState
      super.initState();
      Article.getHomeData();
      _controller.addListener((){
        print(_controller.offset);
       if (_controller.position.pixels ==
          _controller.position.maxScrollExtent) {
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
            // child: vm.isLoading?Center(child: CircularProgressIndicator(),):Container(
            //   child: ListView(
            //     controller: _controller,
            //     children: <Widget>[
            //       Padding(padding: const EdgeInsets.all(8.0),child: vm.ads.isNotEmpty ? HomeBanner(banners: vm.ads,) : Container()),
            //       Container(height: 8,color: Colors.grey[100],),
            //       vm.articles.isNotEmpty ? ListView.builder(
            //         shrinkWrap: true,
            //         physics: ClampingScrollPhysics(),
            //         itemCount: vm.articles.length + 1,
            //         itemBuilder: (context,index){
            //           if(index < vm.articles.length){
            //             return ArticleView(vm: vm.articles[index]);
            //           }
            //           return _getMoreWidget(vm.loadingMoreStatus);
            //         },
            //       ):Container()
            //     ],
            //   )
            )
           
            
          
        
      );
        
      }

  
  
    Widget _getMoreWidget(int loadMoreStatus) {
      if(loadMoreStatus == 0){
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
                  loadMoreStatus == 2 ? '已经到底了': '加载中...     ',
                  style: TextStyle(fontSize: 16.0),
                ),
                loadMoreStatus == 2 ? null : CircularProgressIndicator(strokeWidth: 1.0,)
              ],
            ),
          ),
       );
      }
     
    }
  }