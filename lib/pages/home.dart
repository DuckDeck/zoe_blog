import 'package:flutter/material.dart';
import 'package:zoe_blog/model/article.dart';
import 'package:zoe_blog/widgets/search_bar.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:zoe_blog/redux/view_modules/home.dart';
import 'package:zoe_blog/redux/states/reduxState.dart';
import 'package:zoe_blog/widgets/home_banner.dart';
import 'package:zoe_blog/widgets/home_article.dart';
class HomePage extends StatefulWidget{
  @override
    State<StatefulWidget> createState() =>_HomePageSate();
}
class _HomePageSate extends State<HomePage>{
  ScrollController _controller = new ScrollController(); 
  int index = 0;
  var isLoadAll = false;
  var isLoadingMore = false;
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
          
       }
      });
    }

    @override
      Widget build(BuildContext context) {
        // TODO: implement build
        return Scaffold(backgroundColor: Colors.white,
              appBar: AppBar(
        elevation: 0.0,
        title: GestureDetector(
          child: SearchBar(
            enabled: false,
          ),
          onTap: () {
           
          },
        ),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 8.0),
            child: CircleAvatar(
              child: Text(DateTime.now().day.toString()),
            ),
          ),
        ],
      ),
      body: StoreConnector<ReduxState,HomeViewModel>(
        converter: (store)=>HomeViewModel(store),
        builder: (conrext,vm){
          return Container(
            child: vm.isLoading?Center(child: CircularProgressIndicator(),):Container(
              child: ListView(
                primary: true,
                children: <Widget>[
                  Padding(padding: const EdgeInsets.all(8.0),child: vm.ads.isNotEmpty ? HomeBanner(banners: vm.ads,) : Container()),
                  Container(height: 8,color: Colors.grey[100],),
                  vm.articles.isNotEmpty ? ListView.builder(
                    controller: _controller,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: vm.articles.length + 1,
                    itemBuilder: (context,index){
                      if(index < vm.articles.length){
                        return ArticleView(vm: vm.articles[index]);
                      }
                      return isLoadingMore ? _getMoreWidget() : null;
                    },
                  ):Container()
                ],
              ),
            )
          );
        },
      )
        );
      }

      void loadMore(){
        if(!isLoadingMore){
          setState(() {
            isLoadingMore = true;
          });
        }
      }

      Widget _getMoreWidget() {
      return Center(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                isLoadAll ? '已经到底了': '加载中...     ',
                style: TextStyle(fontSize: 16.0),
              ),
              isLoadAll ? null : CircularProgressIndicator(strokeWidth: 1.0,)
            ],
          ),
        ),
     );
  }
  }