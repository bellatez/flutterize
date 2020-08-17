import 'package:flutter/material.dart';
import 'package:learnflutter/ui/splash_screen.dart';

//All apps need to be in a material app
void main() => runApp(
  new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
  ));

