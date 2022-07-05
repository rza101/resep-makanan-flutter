import 'package:flutter/material.dart';
import 'package:resep_makanan/screens/main_screen.dart';
import '../utils/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return const MainScreen();
      }), (route) => false);
    });

    return Scaffold(
      body: SafeArea(child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Center(
            child: SizedBox(
              height: constraints.maxHeight * 0.5,
              width: constraints.maxWidth * 0.5,
              child: Image.asset(
                'images/logo_text.png',
                color: color1,
              ),
            ),
          );
        },
      )),
    );
  }
}
