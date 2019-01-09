import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final String placeholder;
  final bool enabled;
  final Function onSubmitted;
  final Function iconClick;
  const SearchBar(
      {Key key, this.placeholder = "搜索文章/用户/标签", this.enabled = true, this.onSubmitted,this.iconClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5.0)),
      child: TextField(
        enabled: enabled,
        decoration: InputDecoration(
          hintText: placeholder,
          border: InputBorder.none,
          suffixIcon: IconButton(icon: Icon(Icons.search),onPressed: iconClick,),
          contentPadding: EdgeInsets.all(8),
          
        ),
        onSubmitted: onSubmitted,
      ),
    );
  }
}
