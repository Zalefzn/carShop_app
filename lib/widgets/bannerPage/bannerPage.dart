import 'package:car_shop/utilities/config/sizeConfig.dart';
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
        ),
        height: SizeConfig.blockVertical * 30,
        width: SizeConfig.blockHorizontal * 90,
        decoration: BoxDecoration(
          image: const DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/ferarri.png'),
          ),
          borderRadius: BorderRadius.circular(30),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          headers(),
        ],
      ),
    );
  }
}
