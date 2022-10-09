import 'package:car_shop/models/modelCar.dart';
import 'package:car_shop/utilities/config/sizeConfig.dart';
import 'package:car_shop/widgets/detailPage/detailPage.dart';
import 'package:flutter/material.dart';

class ListScroll extends StatefulWidget {
  final CarModel carModel;

  const ListScroll(this.carModel, {Key? key}) : super(key: key);

  @override
  State<ListScroll> createState() => _List();
}

class _List extends State<ListScroll> {
  @override
  Widget build(BuildContext context) {
    var getPrice = widget.carModel.price;
    var getCar = widget.carModel.car;

    SizeConfig().init(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPage(widget.carModel)));
      },
      child: Column(children: [
        Container(
          margin: EdgeInsets.only(
              bottom: SizeConfig.blockVertical * 4,
              top: SizeConfig.blockVertical * 1),
          height: SizeConfig.blockVertical * 25,
          width: SizeConfig.blockHorizontal * 90,
          decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(40)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(getCar,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: SizeConfig.blockVertical * 1),
                Text(getPrice,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w600))
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
