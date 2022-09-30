import 'package:car_shop/utilities/config/sizeConfig.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _Detail();
}

class _Detail extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Widget contentHead() {
      return Stack(
        children: [
          Container(),
        ],
      );
    }

    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            contentHead(),
          ],
        ),
      ),
    );
  }
}
