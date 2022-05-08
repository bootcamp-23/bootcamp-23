import 'package:flutter/material.dart';
import 'package:yildizlar/src/view/home/home.dart';
import 'package:yildizlar/src/view/profile_page_view.dart';

import '../../view/home/home_page_view.dart';


Map<String, Widget Function(BuildContext)> Routes = {
  "home" : (context) => Home(),
};

List<Widget> pages = [
  Container(height: 50, width: 50, color: Colors.pink,),
  Container(height: 50, width: 50, color: Colors.black,),
  HomePageView(),
  Container(height: 50, width: 50, color: Colors.yellow,),
  ProfilePageView(),
];

List<String> pagesStr = [
  "home",

];