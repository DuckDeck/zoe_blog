import 'package:flutter/material.dart';
import 'package:zoe_blog/pages/main.dart';
import 'package:zoe_blog/widgets/tabbar_item.dart';

class TabPage extends StatefulWidget {
  @override
  TabPageState createState() {
    return new TabPageState();
  }
}

class TabPageState extends State<TabPage> with TickerProviderStateMixin {
  TabController controller;
  int selectedIndex = 0;
  @override
  void initState() {
    controller = TabController(vsync: this, length: 4);
    controller.addListener(() {
      setState(() {
        selectedIndex = controller.index;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: controller,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          HomePage(),
          HomePage(),
        ],
      ),
      bottomNavigationBar: Material(
        color: Colors.grey[100],
        child: TabBar(
          isScrollable: false,
          indicatorColor: Colors.transparent,
          controller: controller,
          tabs: <Widget>[
            TabBarItem(
              text: "首页",
              icon: Icons.home,
              selected: selectedIndex == 0,
            ),
            TabBarItem(
              text: "我的",
              icon: Icons.info,
              selected: selectedIndex == 3,
            )
          ],
        ),
      ),
    );
  }
}
