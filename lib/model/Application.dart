import 'package:flutter/material.dart';
import 'package:learnflutter/parsing_json/json_parsing_map.dart';
import 'package:learnflutter/ui/home.dart';

class Application {
  Widget widgetName;
  String appName;
  String description;

  Application({this.widgetName, this.appName, this.description});

  static List<Application> getApplications () => [
    Application(widgetName:ScaffoldExample(), appName: "Magic Scaffold", description: "Get the most out of Scaffolding"),
//    Application(widgetName: CustomButton(), appName: "Magic Button", description: "Making your own Custom Button"),
//    Application(widgetName: Home(), appName: "Greet Me", description: "Say hello to The basics"),
    Application(widgetName: BizCard(), appName: "Biznes Card", description: "Digital Business Cards"),
    Application(widgetName: Wisdom(), appName: "LynSpire", description: "Get daily quotes to inspire you"),
    Application(widgetName: BillSplitter(), appName: "feedn'pay", description: "Calculate tips and per person pay for your meal"),
    Application(widgetName: Cinemania(), appName: "Cinemania", description: "Your best movies on your phone"),
    Application(widgetName: JsonParsingMap(), appName: "JsonPosts", description: "Get posts using Json")
  ];
}