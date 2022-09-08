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
      return Container(
        height: SizeConfig.blockVertical * 40,
        width: SizeConfig.blockHorizontal * 70,
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(30),
        ),
      );
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
