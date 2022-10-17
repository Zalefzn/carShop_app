import 'package:car_shop/providers/providerCar.dart';
import 'package:car_shop/screen/listScroll.dart';
import 'package:car_shop/utilities/config/sizeConfig.dart';
import 'package:car_shop/widgets/homePage/gridHome.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _Home();
}

class _Home extends State<HomePage> {
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
            margin: EdgeInsets.only(top: SizeConfig.blockVertical * 4),
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
      return Container(
        height: SizeConfig.blockVertical * 64,
        width: SizeConfig.blockHorizontal * 90,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: providerCar.getCarSearch.length != 0 ||
                  controller.text.toLowerCase().isNotEmpty
              ? providerCar.getCarSearch
                  .map((carModel) => ListScroll(carModel))
                  .toList()
              : providerCar.getCar
                  .map((carModel) => ListScroll(carModel))
                  .toList(),
        ),
      );
    }

    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: [
            headers(),
            contentSearch(),
            SizedBox(height: SizeConfig.blockVertical * 2),
            contentUnder(),
            listViewData(),
          ],
        ),
      )),
    );
  }
}
