import 'package:car_shop/utilities/config/sizeConfig.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _Splash();
}

class _Splash extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
        const Duration(seconds: 2),
        () => Navigator.pushNamedAndRemoveUntil(
            context, '/bannerPage', (route) => false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          height: 260,
          width: 260,
          child: const Center(
              child: Text('CFL',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold))),
        ),
      ),
    );
  }
}
