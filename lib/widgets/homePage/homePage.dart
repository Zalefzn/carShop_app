import 'package:car_shop/screen/fromField.dart';
import 'package:car_shop/utilities/config/sizeConfig.dart';
import 'package:car_shop/widgets/homePage/gridHome.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _Home();
}

class _Home extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget headers() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin: EdgeInsets.only(
                right: SizeConfig.blockHorizontal * 30,
                top: SizeConfig.blockVertical * 5),
            child: const Text(
              'Choose What\nDo You Like...',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/wishList');
            },
            child: Container(
                height: 25,
                width: 25,
                child: Image(image: AssetImage('assets/love1.png'))),
          ),
        ],
      );
    }

    Widget contentSearch() {
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: SizeConfig.blockVertical * 5),
            height: SizeConfig.blockVertical * 7,
            width: SizeConfig.blockHorizontal * 88,
            child: TextFormField(
              style: const TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                hintText: 'Search Here...',
                hintStyle: TextStyle(color: Colors.grey[700]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),
        ],
      );
    }

    Widget contentUnder() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin: EdgeInsets.only(right: SizeConfig.blockHorizontal * 30),
            child: const Text('recently',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700)),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GridHome()));
                },
                child: Container(
                    height: 30,
                    width: 30,
                    child: const Image(image: AssetImage('assets/grid.png'))),
              ),
              SizedBox(
                width: SizeConfig.blockHorizontal * 2,
              ),
              Container(
                  height: 30,
                  width: 30,
                  child: const Image(image: AssetImage('assets/list.png')))
            ],
          )
        ],
      );
    }

    Widget listViewData() {
      return Column();
    }

    SizeConfig().init(context);
    return Scaffold(
        body: ListView(
      children: [
        headers(),
        contentSearch(),
        SizedBox(height: SizeConfig.blockVertical * 3),
        contentUnder(),
        listViewData(),
      ],
    ));
  }
}
