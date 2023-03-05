import 'package:car_shop/providers/providerCar.dart';
import 'package:car_shop/screen/fromField.dart';
import 'package:car_shop/screen/gridTile.dart';
import 'package:car_shop/utilities/config/sizeConfig.dart';
import 'package:car_shop/widgets/homePage/homePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GridHome extends StatefulWidget {
  const GridHome({Key? key}) : super(key: key);
  @override
  State<GridHome> createState() => _Grid();
}

class _Grid extends State<GridHome> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ProviderCar providerCar = Provider.of<ProviderCar>(context);

    onSearchTextChanged(String text) async {
      providerCar.getCarSearch.clear();
      if (text.isEmpty) {
        setState(() {});
        return;
      }

      providerCar.getCar.forEach((data) {
        if (data.car.toLowerCase().contains(text) ||
            data.carModel.toString().contains(text))
          providerCar.getCarSearch.add(data);
      });
      setState(() {});
    }

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
              onChanged: onSearchTextChanged,
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
          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 1,
            crossAxisSpacing: 1,
            padding: const EdgeInsets.all(2),
            childAspectRatio: 1,
            children: providerCar.getCarSearch.length != 0 ||
                    controller.text.toLowerCase().isNotEmpty
                ? providerCar.getCarSearch.map((car) => GridTiles(car)).toList()
                : providerCar.getCar.map((car) => GridTiles(car)).toList(),
          ));
    }

    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: [
            headers(),
            contentSearch(),
            SizedBox(height: SizeConfig.blockVertical * 3),
            contentUnder(),
            bodyGrid(),
          ],
        ),
      )),
    );
  }
}
