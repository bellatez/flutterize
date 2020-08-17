import 'dart:async';
import 'package:flutter/material.dart';
import 'package:learnflutter/ui/main_menu.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {

  AnimationController controller;
  Animation<double> animation;

  initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 3000), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    startTime();
    controller.forward();
  }

  startTime() async {
    var duration = new Duration(seconds: 6);
    return new Timer(duration, route);
  }
  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => MainMenu()
    )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/3.8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FadeTransition(
                opacity: animation,
                child: Column(
                  children: [
                    Text('FLUTTERIZER', style: TextStyle(color: Colors.red, fontSize: 30.0, fontWeight: FontWeight.w300, letterSpacing: 6.0)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Divider(height: 2.0, thickness: 6.0, color: Colors.black),
                    ),
                    Text('My All in One', style: TextStyle(color: Colors.black,fontSize: 18.0, fontWeight: FontWeight.w700))
                  ],
                ),
//                child: Image.asset("images/logo.png", width: 250.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(" Proudly by TGAPPS", style: TextStyle(color: Colors.grey.shade500, fontWeight: FontWeight.w400, fontSize: 18.0)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
