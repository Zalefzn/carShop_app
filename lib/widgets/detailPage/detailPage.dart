import 'package:car_shop/screen/listComment.dart';
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
          Center(
            child: Container(
              margin: EdgeInsets.only(top: SizeConfig.blockVertical * 4),
              height: SizeConfig.blockVertical * 40,
              width: SizeConfig.blockHorizontal * 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey.shade300,
              ),
            ),
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
              child: const Text(
                  'warna mobil ini adalah warnan kuning\nkecepatan mobil ini bisa menempuh\n300Km/jam, dengan adanya hemat bensin\nmobil ini akan menghemat biaya anda\nsetiap harinya',
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
