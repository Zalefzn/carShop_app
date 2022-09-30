import 'package:car_shop/utilities/config/sizeConfig.dart';
import 'package:flutter/material.dart';

class ListScroll extends StatefulWidget {
  const ListScroll({Key? key}) : super(key: key);

  @override
  State<ListScroll> createState() => _List();
}

class _List extends State<ListScroll> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Stack(children: [
      Container(
        margin: EdgeInsets.only(
            bottom: SizeConfig.blockVertical * 4,
            top: SizeConfig.blockVertical * 1),
        height: SizeConfig.blockVertical * 30,
        width: SizeConfig.blockHorizontal * 90,
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(40)),
      ),
    ]);
  }
}
