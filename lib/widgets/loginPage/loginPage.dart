import 'package:car_shop/utilities/config/sizeConfig.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _Login();
}

class _Login extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    Widget headers() {
      return Container();
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
