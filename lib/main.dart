import 'package:car_shop/widgets/bannerPage/bannerPage.dart';
import 'package:car_shop/widgets/homePage/homePage.dart';
import 'package:car_shop/widgets/splashScreen/splashScreen.dart';
import 'package:car_shop/widgets/wishList/wishList.dart';
import 'package:flutter/material.dart';

import 'widgets/loginPage/loginPage.dart';
import 'widgets/registerPage/registerPage.dart';

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
        '/': (context) => const SplashScreen(),
        '/bannerPage': (context) => const BannerPage(),
        '/loginPage': (context) => const LoginPage(),
        '/regisPage': (context) => const RegisPage(),
        '/homePage': (context) => const HomePage(),
        '/wishList': (context) => const WishList(),
      },
    );
  }
}
