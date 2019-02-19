import 'package:flutter/material.dart';
import 'package:zoe_blog/pages/tab_page.dart';
class HomaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.blue,
          textTheme: TextTheme(
            body1: TextStyle(fontSize: 15.0,color: Colors.black87),
            body2: TextStyle(fontSize: 13.0,color: Colors.grey),
            caption: TextStyle(fontSize: 10.0,color: Colors.grey),
            display1: TextStyle(fontSize: 14.0,color: Colors.black87,fontWeight: FontWeight.bold)
          ),
          
        ),
        home: TabPage(),
      );
  }
}

