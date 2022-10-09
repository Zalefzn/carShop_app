import 'package:car_shop/models/modelCar.dart';
import 'package:car_shop/screen/listComment.dart';
import 'package:car_shop/utilities/config/sizeConfig.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final CarModel carModel;

  const DetailPage(this.carModel, {Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _Detail();
}

class _Detail extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    var getDataCar = widget.carModel.car;

    Widget contentHead() {
      return Stack(
        children: [
          Center(
            child: Container(
                margin: EdgeInsets.only(top: SizeConfig.blockVertical * 4),
                height: SizeConfig.blockVertical * 40,
                width: SizeConfig.blockHorizontal * 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey.shade300,
                ),
                child: Center(
                  child: Text(getDataCar,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                )),
          ),
          Container(
            margin: EdgeInsets.only(
                top: SizeConfig.blockVertical * 7,
                left: SizeConfig.blockHorizontal * 80),
            child: const Icon(Icons.bookmark, color: Colors.grey),
          ),
        ],
      );
    }

    Widget descriptionData() {
      return Container(
        margin: EdgeInsets.only(
            left: SizeConfig.blockHorizontal * 10,
            top: SizeConfig.blockVertical * 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: const Text(
                'Description :',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: SizeConfig.blockVertical * 2),
            Container(
              child: Text(
                  'car : ${widget.carModel.car}\nmodel : ${widget.carModel.carModel}\ncolor : ${widget.carModel.carColor}\nyear : ${widget.carModel.carModelYear.toString()}\nprice : ${widget.carModel.price}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  )),
            ),
            SizedBox(height: SizeConfig.blockVertical * 2),
            Container(
              child: const Text(
                'Comment :',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: SizeConfig.blockVertical * 1),
          ],
        ),
      );
    }

    Widget listComen() {
      return Container(
        height: SizeConfig.blockVertical * 30,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: const [
            ListComment(),
            ListComment(),
            ListComment(),
            ListComment(),
            ListComment(),
          ],
        ),
      );
    }

    Widget buttonRoute() {
      return Column(
        children: [
          Container(
              margin: EdgeInsets.only(
                  top: SizeConfig.blockVertical * 2,
                  bottom: SizeConfig.blockHorizontal * 4),
              height: SizeConfig.blockVertical * 9,
              width: SizeConfig.blockHorizontal * 85,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.black,
              ),
              child: TextButton(
                  onPressed: () {},
                  child: const Text('Order',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold)))),
        ],
      );
    }

    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            contentHead(),
            descriptionData(),
            listComen(),
            buttonRoute(),
          ],
        ),
      ),
    );
  }
}
