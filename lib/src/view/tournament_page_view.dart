import 'package:flutter/material.dart';

class TournamentPageView extends StatelessWidget {
  const TournamentPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: _w * 0.05),
          Container(
              child: Text(
            "Aktif Turnuvalar",
            style: TextStyle(fontSize: 32),
          )),
          InkWell(onTap: () {
            showDialog(barrierColor: Colors.transparent ,context: context, builder: (context) => Container(width: _w * 0.75, height: _w * 0.75 , color: Colors.red));
          }, child: Placeholder(fallbackWidth: 150, fallbackHeight: 150)),
          SizedBox(
            height: _w * 0.1,
          ),
          Divider(thickness: 2, color: Colors.black38),
          SizedBox(height: _w * 0.08),
          Container(
              child: Text(
            "Geçmiş Turnuvalar",
            style: TextStyle(fontSize: 32),
          )),
          Placeholder(fallbackWidth: 150, fallbackHeight: 150),
        ],
      ),
    );
  }
}
