import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: ShopPage()));
}

class ShopPage extends StatelessWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(bottom: 100.0),
              child: Text("MERCH", style: TextStyle(fontFamily: "OoohBaby",
              fontSize: 80, fontWeight: FontWeight.w700
                ),
              ),
            ),

            Container(
              height: getScreenHeight(context) * 0.08,
              width: getScreenWidth(context),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 219, 151, 251),
                  borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(25),
                  bottomRight: Radius.circular(25)
                    ),
                   boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 8), // changes position of shadow
                          ),
                   ],
                  ),
              child: const Padding(
                padding: EdgeInsets.only(left: 30, top: 15),
                child: Text(
                  "Ürünler",
                  style: TextStyle(fontSize: 50, fontFamily: 'Railway'),
                ),
              ),
            ),
            SizedBox(
              height: getScreenHeight(context) * 0.45,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(5, (int index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, right: 8, top: 20, bottom: 15),
                    child: Container(
                      width: getScreenWidth(context) * 0.6,
                      decoration: BoxDecoration(
                        color: list[_random.nextInt(list.length)],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: const Offset(
                                -8, 4), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 80.0),
                        child: Container(
                          height: getScreenHeight(context) * 0.2,
                          width: getScreenWidth(context) * 0.2,
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(25),
                                topLeft: Radius.circular(25)),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

var list = [
  Colors.blue,
  const Color.fromARGB(255, 204, 0, 255),
  const Color.fromARGB(255, 179, 0, 255),
  const Color.fromARGB(255, 255, 7, 7),
  const Color.fromARGB(255, 0, 220, 172)
];
final _random = Random();
