import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_beautiful_onboardings/app/1.travel/travel.dart';
import 'package:flutter_beautiful_onboardings/app/2.online_shopping/online_shopping.dart';
import 'package:flutter_beautiful_onboardings/gen/assets.gen.dart';

void main() {
  runApp(FlutterBeautifulOnBoardingsApp());
}

class FlutterBeautifulOnBoardingsApp extends StatelessWidget {
  const FlutterBeautifulOnBoardingsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: OnlineShoppingOnBoarding(),
    );
  }
}
