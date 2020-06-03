import 'package:flutter/material.dart';

import '../../data/constants/colors.dart';
import '../../pages/account/login_page.dart';
import '../../widgets/common/custom_background.dart';
import 'about_page.dart';
import 'change_language_page.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MainBackground(),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          brightness: Brightness.light,
          backgroundColor: Colors.transparent,
          title: Text(
            'Settings',
            style: TextStyle(color: AppColor.darkGrey),
          ),
          elevation: 0,
        ),
        body: SafeArea(
          bottom: true,
          child: LayoutBuilder(
                      builder:(builder,constraints)=> SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(minHeight: constraints.maxHeight),
                          child: Padding(
              padding: const EdgeInsets.only(top: 24.0, left: 24.0, right: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      'General',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                  ),
                  ListTile(
                    title: Text('Language A / का'),
                    leading: Image.asset('assets/icons/language.png'),
                    onTap: () => Navigator.of(context).push<dynamic>(
                        MaterialPageRoute<dynamic>(builder: (_) => ChangeLanguagePage())),
                  ),
                   ListTile(
                    title: Text('Legal & About'),
                     leading: Image.asset('assets/icons/legal.png'),
                    onTap: () => Navigator.of(context).push<dynamic>(
                        MaterialPageRoute<dynamic>(builder: (_) => AboutPage())),
                  ),
                   ListTile(
                    title: Text('About Us'),
                     leading: Image.asset('assets/icons/about_us.png'),
                    onTap: (){},
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Text(
                      'Account',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                  ),
                  // ListTile(
                  //   title: Text('Change Password'),
                  //   leading: Image.asset('assets/icons/change_pass.png'),
                  //   onTap: () => Navigator.of(context).push<dynamic>(
                  //       MaterialPageRoute<dynamic>(builder: (_) => ChangePasswordPage())),
                  // ),
                  ListTile(
                    title: Text('Sign out'),
                      leading: Image.asset('assets/icons/sign_out.png'),
                    onTap: () => Navigator.of(context).pushReplacement(
                        MaterialPageRoute<dynamic>(builder: (_) => LoginPage())),
                  ),
                  
                ],
              ),
            ),
                        ),
                      )
          ),
        ),
      ),
    );
  }
}