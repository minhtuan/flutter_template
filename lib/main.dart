import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_template/pages/account/login_page.dart';
import 'package:flutter_template/pages/intro/intro_page.dart';

import 'data/constants/app_theme.dart';
import 'data/constants/strings.dart';
import 'localization/app_translations_delegate.dart';
import 'localization/application.dart';
import 'routes.dart';
import 'tabbar_control.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppTranslationsDelegate _newLocaleDelegate;
  
  void onLocaleChange(Locale locale) {
    setState(() {
      _newLocaleDelegate = AppTranslationsDelegate(newLocale: locale);
    });
  }

  @override
  void initState() {
    super.initState();
    _newLocaleDelegate = AppTranslationsDelegate(newLocale: const Locale('en', ''));
    application.onLocaleChanged = onLocaleChange;
  }
  
  @override
  Widget build(BuildContext context) {
    debugPaintSizeEnabled = false;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //localizationsDelegates: [S.delegate],
      //supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: [
        _newLocaleDelegate,
        //provides localised strings
        GlobalMaterialLocalizations.delegate,
        //provides RTL support
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('vi', ''),
      ],
      title: Strings.appName,
      theme: themeData,
      // routes: Routes.routes,
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/login':
            return SlideRightRoute(widget: LoginPage());
            break;
          case '/home':
            return SlideRightRoute(widget: TabBarControl());
            break;
          //case '/intro':
          default:
            return SlideRightRoute(widget: IntroPage());
            break;
        }
      },
      home: TabBarControl(),// IntroPage(),
    );
  }
}

class SlideRightRoute extends PageRouteBuilder<dynamic> {
  final Widget widget;
  SlideRightRoute({this.widget})
      : super(
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return widget;
          },
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
}