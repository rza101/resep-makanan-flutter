import 'package:flutter/material.dart';
import 'package:resep_makanan/utils/constants.dart';

class AboutScreen extends StatelessWidget{
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('About', style: appBarTitleTextStyle,)),
      ),
    );
  }
}