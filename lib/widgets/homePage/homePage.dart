import 'package:car_shop/utilities/config/sizeConfig.dart';
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
        children: [
          Container(
            child: const Text(
              'Choose What\nDo You Like...',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      );
    }

    Widget contentSearch() {
      return Container(
        height: SizeConfig.blockVertical * 8,
        width: SizeConfig.blockHorizontal * 80,
        child: TextFormField(),
      );
    }

    Widget contentUnder() {
      return Row(
        children: [
          Container(),
        ],
      );
    }

    SizeConfig().init(context);
    return Scaffold(
        body: ListView(
      children: [
        headers(),
        contentSearch(),
        contentUnder(),
      ],
    ));
  }
}
