import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:yildizlar/src/core/constants/routes.dart';
import 'package:yildizlar/src/core/constants/theme.dart';
import 'package:yildizlar/src/view/profile_page_view.dart';

class HomePageView extends ConsumerWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double _w = MediaQuery.of(context).size.width;
    return AnimationLimiter(
      child: ListView.builder(
        padding: EdgeInsets.all(_w / 30),
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        itemCount: 20,
        itemBuilder: (BuildContext c, int i) {
          return AnimationConfiguration.staggeredList(
            position: i,
            delay: Duration(milliseconds: 100),
            child: SlideAnimation(
              duration: Duration(milliseconds: 2500),
              curve: Curves.fastLinearToSlowEaseIn,
              horizontalOffset: 30,
              verticalOffset: 300.0,
              child: FlipAnimation(
                duration: Duration(milliseconds: 3000),
                curve: Curves.fastLinearToSlowEaseIn,
                flipAxis: FlipAxis.y,
                child: Container(
                  margin: EdgeInsets.only(bottom: _w / 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 40,
                        spreadRadius: 10,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          margin: EdgeInsets.all(8),
                          width: _w * 0.8,
                          height: _w * 0.4,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(25))),
                      Text(
                        "Lorem Ipsum",
                        style: TextStyle(fontSize: 32),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce finibus tristique felis, vel hendrerit massa faucibus sodales. Nam eleifend tristique mauris, placerat fermentum justo accumsan eu. Mauris hendrerit nunc eget turpis ullamcorper, eu sagittis lacus fermentum. Ut nec sapien lacus. Cras id purus id dui vehicula maximus. Sed vitae consequat ligula. Integer a quam tincidunt, vehicula sem quis, accumsan diam. Aenean tempor lacinia elit, vel euismod mauris facilisis non.",
                          style: TextStyle(fontSize: 16),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
