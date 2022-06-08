import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuPageView extends StatefulWidget {
  const MenuPageView({Key? key}) : super(key: key);

  @override
  State<MenuPageView> createState() => _MenuPageViewState();
}

class _MenuPageViewState extends State<MenuPageView> {
  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    double _h = size.height;
    double _w = size.width;
    bool isOpen = false;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(

                children: [
                 Center(
                    child:
                    Image.asset(
                              "assets/images/gamepad.png",
                              height: _w * 0.20,
                              width: _h * 0.20,
                            ),),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  width: 200,
                  height: 45,
                  child: Text("League Of Legends",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Sora',
                          fontWeight: FontWeight.normal)),
                ),
                const SizedBox(
                  width: 200,
                  height: 45,
                  child: Text("Valorant", style: TextStyle(fontSize: 18)),
                ),
                const SizedBox(
                  width: 200,
                  height: 35,
                  child: Text("Counter Strike", style: TextStyle(fontSize: 18)),
                ),
                InkWell(
                  onTap: () {
                    // SetState calismiyor riverpod ile baglanicak
                    setState(() {
                      isOpen == false ? isOpen = true : isOpen = false;
                    });
                  },
                  child: SizedBox(
                    width: 200,
                    height: 45,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text("Other", style: TextStyle(fontSize: 18)),
                        isOpen
                            ? const Icon(Icons.arrow_drop_down)
                            : const Icon(Icons.arrow_drop_up)
                      ],
                    ),
                  ),
                ),
                isOpen ? const SizedBox() : const SizedBox(),
              ],),
              Column(children: [
                const Divider(color: Colors.black54, thickness: 1),
                const SizedBox(
                    width: 180,
                    height: 45,
                    child: Text(
                      "Hakkında",
                      style: TextStyle(color: Colors.black),
                    )),
                const SizedBox(
                    width: 180,
                    height: 35,
                    child: Text(
                      "Destek",
                      style: TextStyle(color: Colors.black),
                    )),

                Padding(
                  padding: const EdgeInsets.only(left: 8.0, bottom: 8),
                  child: Column(
                    children: const [
                      SizedBox(
                          width: 180,
                          height: 35,
                          child: Text(
                            "İletişim",
                            style: TextStyle(color: Colors.black54),
                          )),
                      SizedBox(
                          width: 180,
                          height: 35,
                          child: Text(
                            "Sıkça Sorulan Sorular",
                            style: TextStyle(color: Colors.black54),
                          )),
                    ],
                  ),
                ),
                const Divider(color: Colors.black54, thickness: 1),
                const SizedBox(
                    width: 180,
                    height: 35,
                    child: Text(
                      "Bizi Takip Edin",
                      style: TextStyle(color: Colors.black),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    FaIcon(FontAwesomeIcons.instagram),
                    FaIcon(FontAwesomeIcons.twitter),
                    FaIcon(FontAwesomeIcons.youtube),
                    FaIcon(FontAwesomeIcons.twitch)
                  ],
                ),
                const SizedBox(height: 30,)
              ],),


            ],
          ),
        ));
  }
}
