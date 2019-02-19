import 'package:flutter/material.dart';

import 'package:zoe_blog/widgets/search_bar.dart';
import 'package:zoe_blog/model/article.dart';
class SearchPage extends StatefulWidget{
  @override
    State<StatefulWidget> createState() => SearchPageState();
}

class  SearchPageState extends State<SearchPage>{
 
  @override
    void initState() {
     
      super.initState();

    }
 @override
   Widget build(BuildContext context) {
      return Scaffold(backgroundColor: Colors.white,
        appBar: AppBar(
            elevation: 0.0,
            title: SearchBar(enabled: true, iconClick: (){
              
            },onSubmitted: (String key){
                this.startSearch(key);
            })
             
        ),
      );
     
   }


  void startSearch(String key){
    if(key.isEmpty){
      return;
    }
    Article.searchArticle(key, 1, 10);
  }
}