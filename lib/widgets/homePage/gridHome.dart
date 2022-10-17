import 'package:car_shop/screen/fromField.dart';
import 'package:car_shop/screen/gridTile.dart';
import 'package:car_shop/utilities/config/sizeConfig.dart';
import 'package:car_shop/widgets/homePage/homePage.dart';
import 'package:flutter/material.dart';

class GridHome extends StatefulWidget {
  const GridHome({Key? key}) : super(key: key);
  @override
  State<GridHome> createState() => _Grid();
}

class _Grid extends State<GridHome> {
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
                color: Colors.black,
              ),
              decoration: InputDecoration(
                prefixIconColor: Colors.black,
                prefixIcon: const Icon(Icons.search),
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
              Container(
                  height: 30,
                  width: 30,
                  child: const Image(image: AssetImage('assets/grid.png'))),
              SizedBox(
                width: SizeConfig.blockHorizontal * 2,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                },
                child: Container(
                    height: 30,
                    width: 30,
                    child: const Image(image: AssetImage('assets/list.png'))),
              )
            ],
          )
        ],
      );
    }

    Widget bodyGrid() {
      return Container(
        height: SizeConfig.blockVertical * 63,
        width: SizeConfig.blockHorizontal * 100,
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 2,
          ),
          children: const [
            GridTiles(),
            GridTiles(),
            GridTiles(),
            GridTiles(),
            GridTiles(),
            GridTiles(),
            GridTiles(),
            GridTiles(),
            GridTiles(),
            GridTiles(),
            GridTiles(),
            GridTiles(),
          ],
        ),
      );
    }

    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          headers(),
          contentSearch(),
          SizedBox(height: SizeConfig.blockVertical * 3),
          contentUnder(),
          bodyGrid(),
        ],
      )),
    );
  }
}
