import 'package:flutter/material.dart';
import 'package:resep_makanan/screens/about_screen.dart';
import '../utils/constants.dart';
import '../widgets/main_screen_grid_view.dart';
import '../widgets/main_screen_list_view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isListView = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: appBarLeadingIcon,
          title: const Text('Resep Makanan', style: appBarTitleTextStyle),
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
                    return const AboutScreen();
                  }));
                }
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                      value: 'change_view',
                      child:
                          Text(isListView ? 'Show as Grid' : 'Show as List')),
                  const PopupMenuItem(value: 'about', child: Text('About')),
                ];
              },
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7.5),
          child: Center(
            child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              if (isListView) {
                return const ListViewRecipe();
              } else {
                int crossAxisCount;

                if (constraints.maxWidth < deviceBreakpoint) {
                  crossAxisCount = 2;
                } else {
                  crossAxisCount = 4;
                }

                return GridViewRecipe(crossAxisCount: crossAxisCount);
              }
            }),
          ),
        ),
      ),
    );
  }
}