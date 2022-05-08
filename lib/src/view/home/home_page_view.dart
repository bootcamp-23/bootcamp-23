import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:yildizlar/src/core/constants/routes.dart';
import 'package:yildizlar/src/core/constants/theme.dart';
import 'package:yildizlar/src/view/profile_page_view.dart';


class HomePageView extends ConsumerWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(itemBuilder: (context, index) {
      return ListTile(title: Text("Item $index"),);
    },
    itemCount: 5,
    );
  }
}