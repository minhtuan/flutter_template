import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'data/constants/app_theme.dart';
import 'data/constants/strings.dart';
import 'generated/i18n.dart';
import 'pages/intro/intro_page.dart';
import 'routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPaintSizeEnabled = false;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [S.delegate],
      supportedLocales: S.delegate.supportedLocales,
      title: Strings.appName,
      theme: themeData,
      routes: Routes.routes,
      home: IntroPage(),
    );
  }
}