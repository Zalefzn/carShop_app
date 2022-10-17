import 'package:car_shop/providers/providerCar.dart';
import 'package:car_shop/providers/wishList_provider.dart';
import 'package:car_shop/widgets/bannerPage/bannerPage.dart';
import 'package:car_shop/widgets/homePage/homePage.dart';
import 'package:car_shop/widgets/splashScreen/splashScreen.dart';
import 'package:car_shop/widgets/wishList/wishList.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'providers/userProvider.dart';
import 'widgets/loginPage/loginPage.dart';
import 'widgets/registerPage/registerPage.dart';

void main() {
  runApp(const CarShop());
}

class CarShop extends StatelessWidget {
  const CarShop({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProviderCar(),
        ),
        ChangeNotifierProvider(
          create: (context) => WishListProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashScreen(),
          '/bannerPage': (context) => const BannerPage(),
          '/loginPage': (context) => const LoginPage(),
          '/regisPage': (context) => const RegisPage(),
          '/homePage': (context) => const HomePage(),
          '/wishList': (context) => const WishList(),
        },
      ),
    );
  }
}
