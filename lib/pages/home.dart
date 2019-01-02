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
  int index = 0;
  @override
    void initState() {
      // TODO: implement initState
      super.initState();
      Article.getHomeData();
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
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: vm.articles.length,
                    itemBuilder: (context,index){
                      return ArticleView(vm: vm.articles[index]);
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
}