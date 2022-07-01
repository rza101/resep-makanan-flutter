import 'package:flutter/material.dart';
import 'package:resep_makanan/models/recipe.dart';
import 'package:resep_makanan/screens/about_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isListView = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Resep Makanan'),
          actions: [
            PopupMenuButton<String>(
              onSelected: (option) {
                if (option == 'change_view') {
                  setState(() {
                    isListView = !isListView;
                  });

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                        isListView ? 'Showing as List' : 'Showing as Grid'),
                  ));
                } else if (option == 'about') {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return AboutScreen();
                  }));
                }
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                      value: 'change_view',
                      child:
                          Text(isListView ? 'Show as Grid' : 'Show as List')),
                  PopupMenuItem(value: 'about', child: Text('About')),
                ];
              },
            )
          ],
        ),
        body: Center(
          child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            if (isListView) {
              return ListViewRecipe();
            } else {
              int crossAxisCount;

              if (constraints.maxWidth < 768) {
                crossAxisCount = 3;
              } else {
                crossAxisCount = 5;
              }

              return GridViewRecipe(crossAxisCount: crossAxisCount);
            }
          }),
        ),
      ),
    );
  }
}

class GridViewRecipe extends StatelessWidget {
  int crossAxisCount;

  GridViewRecipe({required this.crossAxisCount});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: crossAxisCount,
      children: recipes.map((recipe) {
        return Text('${recipe.name}');
      }).toList(),
    );
  }
}

class ListViewRecipe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final Recipe recipe = recipes[index];

        return InkWell(
          onTap: () {},
          child: Text('${recipe.name}'),
        );
      },
      itemCount: recipes.length,
    );
  }
}
