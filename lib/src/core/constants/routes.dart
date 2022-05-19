import 'package:flutter/material.dart';
import 'package:yildizlar/src/view/home/home.dart';
import 'package:yildizlar/src/view/login_register/login_page.dart';
import 'package:yildizlar/src/view/profile_page_view.dart';
import 'package:yildizlar/src/view/shop_page_view.dart';
import 'package:yildizlar/src/view/tournament_page_view.dart';

import '../../view/home/home_page_view.dart';


Map<String, Widget Function(BuildContext)> Routes = {
  "home" : (context) => Home(),
  "loginPage" : (context) => LoginPage(),
};

List<Widget> pages = [
  ShopPage(),
  TournamentPageView(),
  HomePageView(),
  Container(height: 50, width: 50, color: Colors.yellow,),
  ProfilePageView(),
];

List<String> pagesStr = [
  "home",

];