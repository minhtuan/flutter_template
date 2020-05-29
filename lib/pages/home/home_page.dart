import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/pages/category/category_list_page.dart';

import '../../pages/notification/notifications_page.dart';
import '../../pages/product/product_page.dart';
import '../../pages/search/search_page.dart';
import '../../pages/settings/settings_page.dart';
import '../../pages/shop/check_out_page.dart';
import 'components/custom_bottom_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin<HomePage> {
  TabController bottomTabController;

  @override
  void initState() {
    super.initState();
    //tabController = TabController(length: 5, vsync: this);
    bottomTabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    Widget appBar = Container(
      height: kToolbarHeight + MediaQuery.of(context).padding.top,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
              onPressed: () => Navigator.of(context).push<dynamic>(
                  MaterialPageRoute<dynamic>(
                      builder: (_) => NotificationsPage())),
              icon: Icon(Icons.notifications)),
          IconButton(
              onPressed: () => Navigator.of(context).push<dynamic>(
                  MaterialPageRoute<dynamic>(builder: (_) => SearchPage())),
              icon: SvgPicture.asset('assets/icons/search_icon.svg'))
        ],
      ),
    );

    return Scaffold(
      bottomNavigationBar: CustomBottomBar(controller: bottomTabController),
      body: TabBarView(controller: bottomTabController, children: <Widget>[
        SafeArea(
          child: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverToBoxAdapter(
                  child: appBar,
                ),
              ];
            },
            body: Container(
              child: Center(child: Text('home page')),
            ),
          )
        ),
        CategoryListPage(),
        CheckOutPage(),
        SettingsPage()
      ]),
    );
  }
}
