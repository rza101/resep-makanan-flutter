import 'package:flutter/material.dart';

const color1 = Color(0xFF614124);
const color2 = Color(0xFFCC704B);
const color3 = Color(0xFFE8C07D);
const color4 = Color(0xFF9FC088);

const deviceBreakpoint = 768;

var appBarLeadingIcon = Padding(
  padding: const EdgeInsets.all(8),
  child: Image.asset(
    'images/logo_only.png',
    color: color1,
  ),
);

const appBarTitleTextStyle = TextStyle(
  fontFamily: 'Arima',
  fontWeight: FontWeight.w700,
  color: color1,
  fontSize: 22.5,
);
const boldTextStyle = TextStyle(
  fontWeight: FontWeight.w500,
);
