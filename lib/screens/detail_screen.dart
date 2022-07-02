import 'package:flutter/material.dart';
import 'package:resep_makanan/utils/constants.dart';

import '../models/recipe.dart';

class DetailScreen extends StatelessWidget{
  Recipe recipe;

  DetailScreen({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Detail', style: appBarTitleTextStyle,)),
      ),
    );
  }
}