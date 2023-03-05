// ignore_for_file: file_names

import 'package:car_shop/providers/providerCar.dart';
import 'package:car_shop/providers/userProvider.dart';
import 'package:car_shop/utilities/config/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _Splash();
}

class _Splash extends State<SplashScreen> {
  @override
  void initState() {
    getDataCar();
    super.initState();
  }

  getDataCar() async {
    await Provider.of<UserProvider>(context, listen: false).getUsers();
    await Provider.of<ProviderCar>(context, listen: false).getCars();
    Future.delayed(
        const Duration(seconds: 3),
        () => Navigator.pushNamedAndRemoveUntil(
            context, '/bannerPage', (route) => false));
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(0),
          height: 260,
          width: 260,
          child: Center(
            child: Container(
              height: 120,
              width: 120,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage('assets/logo.png')),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
