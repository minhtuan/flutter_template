import 'package:flutter/material.dart';

import 'pages/home/home_page.dart';
import 'pages/intro/intro_page.dart';


class Routes {
  Routes._();

  //static variables
  static const String intro = '/intro';
  static const String home = '/home';

  static final routes = <String, WidgetBuilder>{
    intro: (BuildContext context) => IntroPage(),
    home: (BuildContext context) => HomePage(),
  };
}
