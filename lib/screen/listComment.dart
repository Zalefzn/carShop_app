import 'package:car_shop/utilities/config/sizeConfig.dart';
import 'package:flutter/material.dart';

class ListComment extends StatefulWidget {
  const ListComment({Key? key}) : super(key: key);

  @override
  State<ListComment> createState() => _Comment();
}

class _Comment extends State<ListComment> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Stack(children: [
      Center(
        child: Container(
          margin: EdgeInsets.only(
              top: SizeConfig.blockVertical * 2,
              bottom: SizeConfig.blockVertical * 2),
          height: SizeConfig.blockVertical * 9,
          width: SizeConfig.blockHorizontal * 85,
          child: Row(
            children: [
              Container(
                  margin: EdgeInsets.only(left: SizeConfig.blockHorizontal * 2),
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  )),
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(30)),
        ),
      )
    ]);
  }
}
