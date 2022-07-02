import 'package:flutter/material.dart';
import 'package:resep_makanan/screens/main_screen.dart';
import '../utils/constants.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return MainScreen();
      }), (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Center(
            child: Container(
                height: constraints.maxHeight * 0.5,
                width: constraints.maxWidth * 0.5,
                child: Image.asset('images/logo_text.png', color: color1)),
          );
        },
      )),
    );
  }
}
