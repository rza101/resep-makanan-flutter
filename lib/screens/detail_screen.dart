import 'package:flutter/material.dart';
import 'package:resep_makanan/utils/constants.dart';
import 'package:resep_makanan/widgets/detail_screen_mobile.dart';
import 'package:resep_makanan/widgets/detail_screen_web.dart';

import '../models/recipe.dart';

class DetailScreen extends StatelessWidget {
  final Recipe recipe;

  const DetailScreen({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Detail',
            style: appBarTitleTextStyle,
          ),
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if(constraints.maxWidth < deviceBreakpoint || MediaQuery.of(context).orientation == Orientation.portrait){
              return DetailScreenMobile(recipe: recipe);
            }else{
              return DetailScreenWeb(recipe: recipe);
            }
          },
        ));
  }
}
