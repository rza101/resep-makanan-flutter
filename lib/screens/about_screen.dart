import 'package:flutter/material.dart';
import 'package:resep_makanan/utils/constants.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'About',
          style: appBarTitleTextStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  return ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: constraints.maxHeight * 0.5,
                      maxWidth: constraints.maxWidth * 0.5,
                    ),
                    child: Image.asset(
                      'images/me.jpg',
                    ),
                  );
                }),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Rheza Rijaya',
                      textAlign: TextAlign.center,
                      style: boldTextStyle.copyWith(
                        fontSize: 27.5,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 5,
                      ),
                      child: const Text(
                        '"Keep Calm And Try Harder"',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 17.5,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 5,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Image.asset(
                                'images/gh.png',
                                width: 30,
                                height: 30,
                              ),
                              const Text(
                                'rza101',
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Image.asset(
                                'images/ig.png',
                                width: 30,
                                height: 30,
                              ),
                              const Text(
                                '@r.za.101',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
