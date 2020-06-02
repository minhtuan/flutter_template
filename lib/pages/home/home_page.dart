import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_template/data/constants/assets.dart';
import 'package:flutter_template/widgets/common/wave_clipper.dart';

import '../../data/constants/colors.dart';
import '../../pages/category/category_list_page.dart';
import '../../pages/notification/notifications_page.dart';
import '../../pages/search/search_page.dart';
import '../../pages/settings/settings_page.dart';
import '../../pages/shop/check_out_page.dart';
import '../../widgets/common/choice_chip.dart';
import '../../widgets/viewmodels/city_card.dart';
import 'components/custom_bottom_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin<HomePage> {
  TabController bottomTabController;
  List<CityCard> cityCards = [
    CityCard(
        'https://cdn.pixabay.com/photo/2013/03/02/02/41/city-89197_960_720.jpg',
        'Kathmandu',
        '12 Feb',
        '10',
        '500',
        '440'),
    CityCard(
        'https://cdn.pixabay.com/photo/2017/12/10/17/40/prague-3010407_960_720.jpg',
        'Bhaktapur',
        '12 Feb',
        '10',
        '500',
        '440'),
    CityCard(
        'https://cdn.pixabay.com/photo/2014/07/01/12/35/taxi-cab-381233_960_720.jpg',
        'Morang',
        '12 Feb',
        '10',
        '500',
        '440'),
  ];

  final List<String> images = [
    breakfast,
    fishtail,
    pancake,
    fewalake,
    fries,
  ];

  final ScrollController _scrollController = ScrollController();
  Color appBarBackground;
  double topPosition;
  bool isflightSelected = true;

  double _getOpacity() {
    double op = (topPosition + 80) / 80;
    return op > 1 || op < 0 ? 1 : op;
  }

  dynamic _onScroll() {
    if (_scrollController.offset > 50) {
      if (topPosition < 0)
        setState(() {
          topPosition = -130 + _scrollController.offset;
          if (_scrollController.offset > 130) topPosition = 0;
        });
    } else {
      if (topPosition > -80)
        setState(() {
          topPosition--;
          if (_scrollController.offset <= 0) topPosition = -80;
        });
    }
  }

  Widget _buildContent() {
    return Stack(
      children: <Widget>[
        SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: <Widget>[
              // const SizedBox(height: 30.0),
              // Container(
              //   padding: const EdgeInsets.only(left: 16.0, right: 50),
              //   height: 190,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.only(bottomLeft:  Radius.circular(30.0), bottomRight: Radius.circular(30.0)),
              //     color: AppColor.blue,
              //   ),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     mainAxisSize: MainAxisSize.min,
              //     children: <Widget>[
              //       const SizedBox(height: 70),
              //       Text(
              //         'Awesome and simple app bar hiding animation',
              //         style: TextStyle(
              //             fontWeight: FontWeight.bold, fontSize: 24.0, color: Colors.white),
              //       ),
              //       const SizedBox(height: 20.0),
              //       Text(
              //         'AWESOME',
              //         style: TextStyle(
              //             fontSize: 16.0,
              //             fontWeight: FontWeight.bold,
              //             color: Colors.white),
              //       )
              //     ],
              //   ),
              // ),
              Stack(children: <Widget>[
                ClipPath(
                  clipper: WaveClipper2(),
                  child: Container(
                    child: Column(),
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0x22ff3a5a), Color(0x22fe494d)])),
                  ),
                ),
                ClipPath(
                  clipper: WaveClipper3(),
                  child: Container(
                    child: Column(),
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0x44ff3a5a), Color(0x44fe494d)])),
                  ),
                ),
                ClipPath(
                  clipper: WaveClipper1(),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Welcome', style: TextStyle(fontSize: 18, color: Colors.white)),
                              Text('How are you today?', style: TextStyle(fontSize: 18, color: Colors.white))
                            ],
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.notifications),
                          color: Colors.white,
                          onPressed: (){

                          },
                        ),
                      ],
                    ),
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xffff3a5a), Color(0xfffe494d)])),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 100),
                  height: 240,
                  // color: Colors.grey.shade800,
                  padding: EdgeInsets.all(16.0),
                  child: Swiper(
                    fade: 0.0,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            image: DecorationImage(
                                image: NetworkImage(images[index]),
                                fit: BoxFit.cover)),
                      );
                    },
                    itemCount: 5,
                    scale: 0.9,
                    pagination: SwiperPagination(),
                  ),
                )
              ]),
              const SizedBox(
                height: 20,
              ),
              Container(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                        onTap: () {
                          setState(() {
                            isflightSelected = true;
                          });
                        },
                        child: ChoiceChip2(
                            Icons.flight_takeoff, 'Flights', isflightSelected)),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                        onTap: () {
                          setState(() {
                            isflightSelected = false;
                          });
                        },
                        child: ChoiceChip2(
                            Icons.hotel, 'Hotel', !isflightSelected)),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text('Currently Watched Items',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 15,
                            fontWeight: FontWeight.w700)),
                    Spacer(),
                    Builder(
                        builder: (BuildContext context) => Text(
                              'View All',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).primaryColor),
                            ))
                  ],
                ),
              ),
              Container(
                height: 210,
                child: ListView(
                    scrollDirection: Axis.horizontal, children: cityCards),
              ),
              const SizedBox(height: 10.0),
            ],
          ),
        ),
        Positioned(
            top: topPosition,
            left: 0,
            right: 0,
            child: Container(
              height: 80,
              padding: const EdgeInsets.only(left: 50, top: 25.0, right: 20.0),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0)),
                color: AppColor.blue.withOpacity(_getOpacity()), // Colors.white
              ),
              child: DefaultTextStyle(
                style: TextStyle(),
                softWrap: false,
                overflow: TextOverflow.ellipsis,
                child: Semantics(
                  child: Text(
                    'Awesome and simple app bar hiding animation',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                  header: true,
                ),
              ),
            )),
        SizedBox(
          height: 80,
          child: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
        )
      ],
    );
  }

  @override
  void initState() {
    topPosition = -80;
    appBarBackground = Colors.transparent;

    super.initState();
    //tabController = TabController(length: 5, vsync: this);
    bottomTabController = TabController(length: 4, vsync: this);
    _scrollController.addListener(_onScroll);
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

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColor.blue,
      statusBarBrightness: Brightness.light,
    ));

    return Scaffold(
      // backgroundColor: AppColor.blue,
      bottomNavigationBar: CustomBottomBar(controller: bottomTabController),
      body: TabBarView(controller: bottomTabController, children: <Widget>[
        SafeArea(child: _buildContent()
            // child: NestedScrollView(
            //   headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            //     return <Widget>[
            //       SliverToBoxAdapter(
            //         child: appBar,
            //       ),
            //     ];
            //   },
            //   body: Container(
            //     child: Center(child: Text('home page')),
            //   ),
            //)
            ),
        CategoryListPage(),
        CheckOutPage(),
        SettingsPage()
      ]),
    );
  }
}
