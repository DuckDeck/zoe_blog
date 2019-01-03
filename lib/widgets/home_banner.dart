import 'dart:async';
import 'package:flutter/material.dart';
import 'package:zoe_blog/model/ad.dart';
import 'package:zoe_blog/widgets/slider_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
class HomeBanner extends StatefulWidget {
  final List<Ad> banners;

  const HomeBanner({Key key, this.banners}) : super(key: key);

  @override
  _HomeBannerState createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  int sliderIndex = 0;
  bool runing = false;
  PageController controller;

  @override
  void initState() {
    controller = new PageController();
    super.initState();
    run();
  }

  void run() async {
    this.runing = true;
    while (this.runing) {
      await Future.delayed(new Duration(seconds: 5));
      if (mounted) {
        this.setState(() {
          this.sliderIndex = this.sliderIndex == widget.banners.length - 1
              ? 0
              : this.sliderIndex + 1;
          this.controller.animateToPage(
                this.sliderIndex,
                duration: new Duration(milliseconds: 600),
                curve: Curves.easeInOut,
              );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Card(
          margin: EdgeInsets.zero,
          elevation: 0.0,
          child: AspectRatio(
            aspectRatio: 9.0 / 5.0,
            child: PageView(
                controller: controller,
                onPageChanged: (index) {
                  setState(() {
                    sliderIndex = index;
                  });
                },
                children: widget.banners
                    .map((ad) => GestureDetector(
                          onTap: () {
                            // final id =
                            //     Uri.parse(ad.click).queryParameters["id"];
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) => VideoPage(
                            //           id: id,
                            //           poster: ad.pic,
                            //         )));
                          },
                          child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: <Widget>[
                             CachedNetworkImage(imageUrl: ad.mainImg,),
                              Container(color: Color.fromARGB(100, 100, 100, 100),),
                              Positioned(
                                bottom: 40,
                                child: Text(ad.name,
                                maxLines: 2,
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center,overflow: TextOverflow.fade,),
                              )
                            ],
                          )
                        ))
                    .toList()),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child:
              SliderIndicator(count: widget.banners.length, index: sliderIndex),
        )
      ],
    );
  }
}
