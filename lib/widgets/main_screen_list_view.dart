import 'package:flutter/material.dart';
import 'package:resep_makanan/models/recipe.dart';
import 'package:resep_makanan/screens/detail_screen.dart';
import 'package:resep_makanan/utils/constants.dart';

class ListViewRecipe extends StatelessWidget {
  const ListViewRecipe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return ListView.builder(
        itemBuilder: (context, index) {
          final Recipe recipe = recipes[index];

          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailScreen(recipe: recipe);
              }));
            },
            child: Card(
              elevation: 3,
              child: SizedBox(
                height:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? constraints.maxHeight * 0.1
                        : constraints.maxHeight * 0.4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        flex: 2,
                        child: Image.asset(
                          'images/${recipe.thumbnail}',
                          fit: BoxFit.cover,
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        flex: 3,
                        child: Text(
                          recipe.name,
                          textAlign: TextAlign.left,
                          style: boldTextStyle,
                        ))
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: recipes.length,
      );
    });
  }
}
