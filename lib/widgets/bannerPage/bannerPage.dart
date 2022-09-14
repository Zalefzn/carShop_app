import 'package:car_shop/utilities/config/sizeConfig.dart';
import 'package:car_shop/utilities/theme/colorTheme.dart';
import 'package:flutter/material.dart';

class BannerPage extends StatefulWidget {
  const BannerPage({Key? key}) : super(key: key);

  @override
  State<BannerPage> createState() => _Banner();
}

class _Banner extends State<BannerPage> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.inactive) {
      print("====> INACTIVE <====");
    }
    if (state == AppLifecycleState.resumed) {
      print("===> Resumed <===");
    }
    if (state == AppLifecycleState.paused) {
      print("===> Puased <===");
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    Widget headers() {
      return Container(
        margin: EdgeInsets.only(
            top: SizeConfig.blockVertical * 20,
            right: SizeConfig.blockHorizontal * 20),
        height: SizeConfig.blockVertical * 30,
        width: SizeConfig.blockHorizontal * 80,
        decoration: BoxDecoration(
          image: const DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/ferarri.png'),
          ),
          borderRadius: BorderRadius.circular(30),
        ),
      );
    }

    Widget textData() {
      return Container(
        margin: EdgeInsets.only(right: SizeConfig.blockHorizontal * 22),
        child: Text('Premium Cars,\nEnjoy theluxury',
            style: TextStyle(
              color: bgColor,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            )),
      );
    }

    Widget textData2() {
      return Container(
        margin: EdgeInsets.only(right: SizeConfig.blockHorizontal * 14),
        child: Text('get your car to brings you\nto the faster like a thunder',
            style: TextStyle(
              color: bgColor2,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            )),
      );
    }

    Widget buttonText() {
      return Container(
          margin: EdgeInsets.only(),
          height: SizeConfig.blockVertical * 8,
          width: SizeConfig.blockHorizontal * 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: bgColor),
          child: TextButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/loginPage', (route) => false);
            },
            child: Text('Get Started',
                style: TextStyle(
                  color: bgColor3,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                )),
          ));
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          headers(),
          SizedBox(height: SizeConfig.blockVertical * 2),
          textData(),
          SizedBox(height: SizeConfig.blockVertical * 2),
          textData2(),
          SizedBox(height: SizeConfig.blockVertical * 15),
          buttonText(),
        ],
      ),
    );
  }
}
