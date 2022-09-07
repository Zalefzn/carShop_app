import 'package:car_shop/widgets/bannerPage/bannerPage.dart';
import 'package:car_shop/widgets/splashScreen/splashScreen.dart';
import 'package:flutter/material.dart';

import 'widgets/loginPage/loginPage.dart';

void main() {
  runApp(const CarShop());
}

class CarShop extends StatelessWidget {
  const CarShop({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/splashScreen': (context) => const SplashScreen(),
        '/bannerPage': (context) => const BannerPage(),
        '/loginPage': (context) => const LoginPage(),
      },
    );
  }
}
