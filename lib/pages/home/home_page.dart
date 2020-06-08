import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_template/data/constants/assets.dart' as assets;

import '../../data/constants/colors.dart';
import '../../pages/notification/notifications_page.dart';
import '../../pages/product/product_detail_page.dart';
import '../../widgets/common/network_image.dart';
import '../../widgets/common/wave_clipper.dart';
import '../../widgets/viewmodels/city_card.dart';

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

  final List<String> flashSaleImages = [
    assets.backgroundImages[0],
    assets.backgroundImages[2],
    assets.backgroundImages[1]
  ];

  final List<String> images = [
    assets.breakfast,
    assets.fishtail,
    assets.pancake,
    assets.fewalake,
    assets.fries,
  ];

  final ScrollController _scrollController = ScrollController();
  Color appBarBackground;
  double topPosition;
  double scrollOffset = 400; //130
  double heightHeader = 100;
  bool isflightSelected = true;

  double _getOpacity() {
    final double op = (topPosition + heightHeader) / heightHeader;
    return op > 1 || op < 0 ? 1 : op;
  }

  dynamic _onScroll() {
    if (_scrollController.offset > 350) {
      //50
      if (topPosition < 0)
        setState(() {
          topPosition = -scrollOffset + _scrollController.offset;
          if (_scrollController.offset > scrollOffset) topPosition = 0;
        });
    } else {
      if (topPosition > -heightHeader)
        setState(() {
          topPosition--;
          if (_scrollController.offset <= 0) topPosition = -heightHeader;
        });
    }
  }

  Widget _buildHeader() {
    return Opacity(
      opacity: _getOpacity(),
        child: Container(
      height: heightHeader,
      child: Stack(
        children: <Widget>[
          Container(
            height: 65,
            padding: const EdgeInsets.only(left: 50, top: 25.0, right: 20.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0)),
              color: AppColor.orange, //.withOpacity(_getOpacity())
            ),
            child: Column(),
          ),
          Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Card(
                    child: Container(
                        width: 280,
                        height: 75,
                        padding: const EdgeInsets.all(10),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundColor: Colors.blue,
                                    maxRadius: 15.0,
                                    child: Icon(
                                      Icons.home,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  Text('DarazMall')
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundColor: Colors.blue,
                                    maxRadius: 15.0,
                                    child: Icon(
                                      Icons.home,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  Text('Flash Sales')
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundColor: Colors.blue,
                                    maxRadius: 15.0,
                                    child: Icon(
                                      Icons.home,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  Text('Vouchers')
                                ],
                              )
                            ],
                          ),
                        ))),
              ))
        ],
      ),
    ));
  }

  Widget _buildSlider() {
    return Stack(children: <Widget>[
      ClipPath(
        clipper: WaveClipper2(),
        child: Container(
          child: Column(),
          width: double.infinity,
          height: 200,
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
          height: 200,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0x44ff3a5a),
            Color(0x44fe494d)
          ])), //Color(0x44ff3a5a), Color(0x44fe494d)
        ),
      ),
      ClipPath(
        clipper: WaveClipper1(),
        child: Container(
          child: Row(),
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
              gradient:
                  LinearGradient(colors: [AppColor.orange, AppColor.orange])),
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 10),
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
                      image: NetworkImage(images[index]), fit: BoxFit.cover)),
            );
          },
          itemCount: 5,
          scale: 0.9,
          pagination: SwiperPagination(),
        ),
      )
    ]);
  }

  Widget _buildCategories() {
    return Container(
      height: 90.0,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  maxRadius: 30.0,
                  child: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text('DarazMall')
              ],
            ),
            Column(
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  maxRadius: 30.0,
                  child: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text('Flash Sales')
              ],
            ),
            Column(
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  maxRadius: 30.0,
                  child: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text('Vouchers')
              ],
            )
          ]),
    );
  }

  Expanded _buildFlashSaleItem(int index) {
    return Expanded(
      child: InkWell(
        child: Container(
          padding: EdgeInsets.all(5.0),
          child: Column(
            children: <Widget>[
              Container(
                height: 80,
                // color: Colors.blue,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(flashSaleImages[index]),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                height: 5.0,
              ),
              Stack(
                children: <Widget>[
                  ClipPath(
                    clipper: ShapeBorderClipper(
                        shape: StadiumBorder(
                            side: BorderSide(
                                width: 1,
                                style: BorderStyle.solid,
                                color: Colors.red))),
                    child: Container(
                      height: 20,
                      color: Colors.red.shade200,
                    ),
                  ),
                  ClipPath(
                    clipper: ShapeBorderClipper(
                        shape: StadiumBorder(
                            side: BorderSide(
                                width: 1,
                                style: BorderStyle.solid,
                                color: Colors.red))),
                    child: Container(
                      padding: EdgeInsets.only(left: 10.0),
                      height: 20,
                      width: 70,
                      color: Colors.red,
                      child: Text(
                        '12 Sold',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              Text('Rs.275')
            ],
          ),
        ),
        onTap: (){
          Navigator.of(context).push<dynamic>(
                        MaterialPageRoute<dynamic>(builder: (_) => ProductDetailsPage()));
        },
      ),
    );
  }

  Widget _buildFlashSales() {
    return Container(
      height: 200,
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    'Flash Sales',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Container(
                      color: Colors.black,
                      padding:
                          EdgeInsets.symmetric(vertical: 2.0, horizontal: 5.0),
                      child: Text(
                        '02',
                        style: TextStyle(color: Colors.white),
                      )),
                  SizedBox(
                    width: 5.0,
                  ),
                  Container(
                      color: Colors.black,
                      padding:
                          EdgeInsets.symmetric(vertical: 2.0, horizontal: 5.0),
                      child: Text(
                        '20',
                        style: TextStyle(color: Colors.white),
                      )),
                  SizedBox(
                    width: 5.0,
                  ),
                  Container(
                      color: Colors.black,
                      padding:
                          EdgeInsets.symmetric(vertical: 2.0, horizontal: 5.0),
                      child: Text(
                        '30',
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              ),
              Text(
                'SHOP MORE >>',
                style: TextStyle(color: Colors.red),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
              _buildFlashSaleItem(0),
              _buildFlashSaleItem(1),
              _buildFlashSaleItem(2),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildCurrentItems() {
    return Container(
      child: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
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
        const SizedBox(height: 10.0),
        Container(
          height: 210,
          child:
              ListView(scrollDirection: Axis.horizontal, children: cityCards),
        ),
      ]),
    );
  }

  Widget _buildJustForYou() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: InkWell(
              child: Column(
                children: <Widget>[
                  PNetworkImage(images[0]),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Top Quality fashion item',
                    softWrap: true,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Rs.1,254',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  )
                ],
              ),
              onTap: (){
                // Navigator.of(context).push<dynamic>(
                //         MaterialPageRoute<dynamic>(builder: (_) => HotelPage()));
              },
            )
          ),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                PNetworkImage(images[1]),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Top Quality fashion item',
                  softWrap: true,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Rs.1,254',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Stack(
      children: <Widget>[
        SingleChildScrollView(
          controller: _scrollController,
          child: Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                _buildSlider(),
                const SizedBox(
                  height: 10,
                ),
                _buildCategories(),
                const SizedBox(height: 10.0),
                _buildFlashSales(),
                // const SizedBox(height: 10.0),
                _buildCurrentItems(),
                const SizedBox(height: 10.0),
                Center(
                    child: Text(
                  'Just for You',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
                )),
                const SizedBox(height: 10.0),
                _buildJustForYou(),
                const SizedBox(height: 10.0),
              ],
            ),
          ),
        ),
        Positioned(top: topPosition, left: 0, right: 0, child: _buildHeader()),
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
    final Widget appBar = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Welcome',
                  style: TextStyle(fontSize: 18, color: Colors.white)),
              Text('How are you today?',
                  style: TextStyle(fontSize: 18, color: Colors.white))
            ],
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            color: Colors.white,
            onPressed: () => Navigator.of(context).push<dynamic>(
                MaterialPageRoute<dynamic>(
                    builder: (_) => NotificationsPage())),
          ),
        ],
      ),
    );

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColor.blue,
      statusBarBrightness: Brightness.light,
    ));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffff3a5a),
        title: appBar,
        elevation: 0,
      ),
      // backgroundColor: AppColor.blue,
      body: SafeArea(child: _buildContent()),
    );
  }
}
