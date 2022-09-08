import 'package:car_shop/utilities/config/sizeConfig.dart';
import 'package:flutter/material.dart';

class BannerPage extends StatefulWidget {
  const BannerPage({Key? key}) : super(key: key);

  @override
  State<BannerPage> createState() => _Banner();
}
 
class _Banner extends State<BannerPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    Widget headers() {
      return Container();
    } 

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          headers(),
        ],
      ),
    );
  }
}
