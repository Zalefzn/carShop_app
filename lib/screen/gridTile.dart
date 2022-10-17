import 'package:car_shop/utilities/config/sizeConfig.dart';
import 'package:flutter/material.dart';

class GridTiles extends StatefulWidget {
  const GridTiles({Key? key}) : super(key: key);
  @override
  State<GridTiles> createState() => _Grid();
}

class _Grid extends State<GridTiles> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: SizeConfig.blockVertical * 2),
        height: SizeConfig.blockVertical * 30,
        width: SizeConfig.blockHorizontal * 44,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
