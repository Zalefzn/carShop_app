import 'package:car_shop/models/modelCar.dart';
import 'package:car_shop/utilities/config/sizeConfig.dart';
import 'package:car_shop/widgets/detailPage/detailPage.dart';
import 'package:flutter/material.dart';

class GridTiles extends StatefulWidget {
  final CarModel car;
  const GridTiles(this.car, {Key? key}) : super(key: key);
  @override
  State<GridTiles> createState() => _Grid();
}

class _Grid extends State<GridTiles> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DetailPage(widget.car)));
        },
        child: Container(
          margin: EdgeInsets.only(top: SizeConfig.blockVertical * 2),
          height: SizeConfig.blockVertical * 30,
          width: SizeConfig.blockHorizontal * 44,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  child: Text(widget.car.car,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      )))
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
