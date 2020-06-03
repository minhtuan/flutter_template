import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'localization/app_translations.dart';
import 'pages/category/category_list_page.dart';
import 'pages/home/home_page.dart';
import 'pages/settings/settings_page.dart';
import 'pages/shop/check_out_page.dart';

class TabBarControl extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){    
    return TabBarControlState();
  }
}

class TabBarControlState extends State<TabBarControl>{
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomePage(),
    CategoryListPage(),
    CheckOutPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Vietravel'),
      // ),
      body: _children[_currentIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            // sets the background color of the `BottomNavigationBar`
            //canvasColor: Colors.green,
            // sets the active color of the `BottomNavigationBar` if `Brightness` is light
            primaryColor: Colors.red,
            textTheme: Theme
                .of(context)
                .textTheme
                .copyWith(caption: TextStyle(color: Colors.grey))), // sets the inactive color of the `BottomNavigationBar`
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: _currentIndex == 0? SvgPicture.asset('assets/icons/home_icon.svg', fit: BoxFit.fitWidth,): SvgPicture.asset('assets/icons/home_icon.svg',),
              title: Text(AppTranslations.of(context).text('Home')),
            ),
            BottomNavigationBarItem(
              icon: _currentIndex == 1? Image.asset('assets/icons/category_icon.png'): Image.asset('assets/icons/category_icon.png'),
              title: Text(AppTranslations.of(context).text('Category')),
            ),
            BottomNavigationBarItem(
              icon: _currentIndex == 2? SvgPicture.asset('assets/icons/cart_icon.svg'): SvgPicture.asset('assets/icons/cart_icon.svg'),
              title: Text(AppTranslations.of(context).text('Checkout')),
            ),
            BottomNavigationBarItem(
              icon: _currentIndex == 4? Image.asset('assets/icons/profile_icon.png'): Image.asset('assets/icons/profile_icon.png'),
              title: Text(AppTranslations.of(context).text('Profile')),
            ),
          ],
        ),
      ),
    );
  }

  void onTabTapped(int index) {
   setState(() {
     _currentIndex = index;
   });
 }
}