import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_template/data/constants/colors.dart';
import 'package:flutter_template/data/constants/styles.dart';
import 'package:flutter_template/data/models/product_model.dart';

import 'add_address_page.dart';
import 'components/shop_item_list.dart';

class CheckOutPage extends StatefulWidget {
  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  SwiperController swiperController = SwiperController();

  List<ProductModel> products = [
    ProductModel(
        'assets/images/headphones.png',
        'Boat roackerz 400 On-Ear Bluetooth Headphones',
        'description',
        45.3),
    ProductModel(
        'assets/images/headphones_2.png',
        'Boat roackerz 100 On-Ear Bluetooth Headphones',
        'description',
        22.3),
    ProductModel(
        'assets/images/headphones_3.png',
        'Boat roackerz 300 On-Ear Bluetooth Headphones',
        'description',
        58.3)
  ];

  @override
  Widget build(BuildContext context) {
    Widget checkOutButton = InkWell(
      onTap: () => Navigator.of(context)
          .push<dynamic>(MaterialPageRoute<dynamic>(builder: (_) => AddAddressPage())),
      child: Container(
        height: 80,
        width: MediaQuery.of(context).size.width / 1.5,
        decoration: BoxDecoration(
            gradient: mainButton,
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.16),
                offset: Offset(0, 5),
                blurRadius: 10.0,
              )
            ],
            borderRadius: BorderRadius.circular(9.0)),
        child: Center(
          child: const Text('Check Out',
              style: TextStyle(
                  color: Color(0xfffefefe),
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  fontSize: 20.0)),
        ),
      ),
    );
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: AppColor.darkGrey),
        actions: <Widget>[
          IconButton(
            icon: Image.asset('assets/icons/denied_wallet.png'),
              onPressed: () => null/*Navigator.of(context).push<dynamic>(
                  MaterialPageRoute<dynamic>(builder: (_) => null UnpaidPage()))*/,
          )
        ],
        title: Text(
          'Checkout',
          style: TextStyle(
              color: AppColor.darkGrey, fontWeight: FontWeight.w500, fontSize: 18.0),
        ),
      ),
      body: LayoutBuilder(
        builder: (_, constraints) => SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  height: 48.0,
                  color: AppColor.yellow,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Subtotal',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      Text(
                        products.length.toString() + ' items',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 300,
                  child: Scrollbar(
                    child: ListView.builder(
                      itemBuilder: (_, index) => ShopItemList(products[index],onRemove: (){
                        setState(() {
                          products.remove(products[index]);
                        });
                      },),
                      itemCount: products.length,
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(16.0),
                //   child: Text(
                //     'Payment',
                //     style: TextStyle(
                //         fontSize: 20,
                //         color: AppColor.darkGrey,
                //         fontWeight: FontWeight.bold),
                //   ),
                // ),
                // SizedBox(
                //   height: 250,
                //   child: Swiper(
                //     itemCount: 2,
                //     itemBuilder: (_, index) {
                //       return CreditCard();
                //     },
                //     scale: 0.8,
                //     controller: swiperController,
                //     viewportFraction: 0.6,
                //     loop: false,
                //     fade: 0.7,
                //   ),
                // ),
                SizedBox(height: 24),
                Center(
                    child: Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).padding.bottom == 0
                          ? 20
                          : MediaQuery.of(context).padding.bottom),
                  child: checkOutButton,
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}