import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yildizlar/src/core/constants/routes.dart';
import 'package:yildizlar/src/core/constants/theme.dart';
import 'package:yildizlar/src/view/home/home_page_view.dart';

import '../menu_page_view.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final drawerController = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ZoomDrawer(
          controller: drawerController,
          mainScreenTapClose: true,
          disableDragGesture: true,
          menuScreen: MenuPageView(),
          mainScreen: HomePage(drawerController: drawerController),
          style: DrawerStyle.defaultStyle,
          mainScreenOverlayColor: ThemeColors.mainColor,
          moveMenuScreen: true,
          menuBackgroundColor: Colors.white,
          borderRadius: 24.0,
          androidCloseOnBackTap: true,
          openDragSensitivity: 200,
          showShadow: true,
          angle: 0,
          drawerShadowsBackgroundColor: ThemeColors.mainColor,
          slideWidth: MediaQuery.of(context).size.width * .65,
          openCurve: Curves.fastOutSlowIn,
          closeCurve: Curves.decelerate,
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  final ZoomDrawerController drawerController;

  const HomePage({Key? key, required this.drawerController}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  int _page = 2;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        animationCurve: Curves.easeOut,
        key: _bottomNavigationKey,
        index: 2,
        animationDuration: Duration(milliseconds: 300),
        items: [
          FaIcon(
            FontAwesomeIcons.shop,
            color: Colors.white,
          ),
          FaIcon(
            FontAwesomeIcons.trophy,
            color: Colors.white,
          ),
          FaIcon(
            FontAwesomeIcons.house,
            color: Colors.white,
          ),
          FaIcon(
            FontAwesomeIcons.medal,
            color: Colors.white,
          ),
          FaIcon(
            FontAwesomeIcons.userNinja,
            color: Colors.white,
          ),
        ],
        color: ThemeColors.mainColor,
        backgroundColor: Color.fromARGB(0, 220, 151, 251),
        onTap: (index) {
          setState(() {
            _page = index;
            // Navigator.of(context).pushReplacementNamed(pagesStr[index]);
          });
        },
      ),
      appBar: AppBar(
        backgroundColor: ThemeColors.mainColor,
        title: _page == 0
            ? Text(
                "Dükkan",
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            : _page == 1
                ? Text(
                    "Turnuvalar",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                : _page == 2
                    ? Text(
                        "Ana Sayfa",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    : _page == 3
                        ? Text(
                            "Skor Tablosu",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        : _page == 4
                            ? Text(
                                "Profil",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            : null,
        centerTitle: false,
        leading: _page == 2
            ? IconButton(
                icon: Icon(Icons.drag_handle),
                onPressed: () => widget.drawerController.toggle!())
            : null,
      ),
      body: pages[_page],
    );
  }
}
