import 'package:flutter/material.dart';
import 'package:resep_makanan/models/recipe.dart';
import 'package:resep_makanan/screens/detail_screen.dart';
import 'package:resep_makanan/utils/constants.dart';

class GridViewRecipe extends StatelessWidget {
  final int crossAxisCount;

  const GridViewRecipe({Key? key, required this.crossAxisCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: crossAxisCount,
      children: recipes.map((recipe) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return DetailScreen(recipe: recipe);
              }),
            );
          },
          child: Card(
            elevation: 3,
            margin: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: Image.asset(
                    'images/${recipe.thumbnail}',
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      recipe.name,
                      textAlign: TextAlign.center,
                      style: boldTextStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
