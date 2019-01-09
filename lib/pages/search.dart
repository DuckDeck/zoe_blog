import 'package:flutter/material.dart';
import 'package:zoe_blog/redux/view_modules/search.dart';
import 'package:zoe_blog/widgets/search_bar.dart';
class SearchPage extends StatefulWidget{
  @override
    State<StatefulWidget> createState() => SearchPageState();
}

class  SearchPageState extends State<SearchPage>{
  SearchViewModel vm;
  @override
    void initState() {
      // TODO: implement initState
      super.initState();

    }
 @override
   Widget build(BuildContext context) {
      return Scaffold(backgroundColor: Colors.white,
        appBar: AppBar(
            elevation: 0.0,
            title: GestureDetector(child: SearchBar(enabled: true, iconClick: (){
              
            },)),
             
        ),
      );
     
   }


  void startSearch(String key){
    if(key.isEmpty){
      return;
    }

  }
}