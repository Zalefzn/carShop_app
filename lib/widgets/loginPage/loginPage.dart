import 'package:car_shop/screen/fromField.dart';
import 'package:car_shop/utilities/config/sizeConfig.dart';
import 'package:car_shop/utilities/theme/colorTheme.dart';
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
      return Container(
        height: SizeConfig.blockVertical * 27,
        width: SizeConfig.blockHorizontal * 100,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100))),
      );
    }

    Widget textWelcome() {
      return Container(
        margin: EdgeInsets.only(
            left: SizeConfig.blockHorizontal * 6,
            top: SizeConfig.blockVertical * 7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text('WELCOME\nBACK!',
                  style: TextStyle(
                      color: bgColor3,
                      fontSize: 24,
                      fontWeight: FontWeight.bold)),
            ),
            Container(
                child: Text('Login Here....',
                    style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 15,
                        fontWeight: FontWeight.bold))),
          ],
        ),
      );
    }

    Widget textField() {
      return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: SizeConfig.blockVertical * 40),
            FromField(false, "Username"),
            SizedBox(height: SizeConfig.blockVertical * 5),
            FromField(true, "Password"),
          ],
        ),
      );
    }

    Widget checkList() {
      return Row(
        children: [
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(),
          ),
        ],
      );
    }

    Widget buttonNavigate() {
      return Center(
        child: Container(
            margin: EdgeInsets.only(top: SizeConfig.blockHorizontal * 110),
            height: SizeConfig.blockVertical * 8,
            width: SizeConfig.blockHorizontal * 80,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),
            child: TextButton(
                onPressed: () {},
                child: const Text('Login',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )))),
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            headers(),
            textWelcome(),
            textField(),
            buttonNavigate(),
          ],
        ),
      ),
    );
  }
}
