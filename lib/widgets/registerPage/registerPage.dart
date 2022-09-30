import 'package:car_shop/screen/fromField.dart';
import 'package:car_shop/utilities/config/sizeConfig.dart';
import 'package:flutter/material.dart';

class RegisPage extends StatefulWidget {
  const RegisPage({Key? key}) : super(key: key);

  @override
  State<RegisPage> createState() => _Regis();
}

class _Regis extends State<RegisPage> {
  @override
  Widget build(BuildContext context) {
    Widget head() {
      return Container(
        height: SizeConfig.blockVertical * 27,
        width: SizeConfig.blockHorizontal * 100,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100)),
        ),
      );
    }

    Widget buildContent() {
      return Container(
        margin: EdgeInsets.only(
            left: SizeConfig.blockHorizontal * 6,
            top: SizeConfig.blockVertical * 7),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              child: const Text('CREATE\nACCOUNT',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold))),
          Container(
            child: Text('Regis here...',
                style: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
          ),
        ]),
      );
    }

    Widget textFormField() {
      return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: SizeConfig.blockVertical * 40),
            const FromField(false, 'Username'),
            SizedBox(height: SizeConfig.blockVertical * 5),
            const FromField(false, "Email"),
            SizedBox(height: SizeConfig.blockVertical * 5),
            const FromField(true, 'Password')
          ],
        ),
      );
    }

    Widget buttonNavigate() {
      return Center(
        child: Container(
            margin: EdgeInsets.only(top: SizeConfig.blockHorizontal * 130),
            height: SizeConfig.blockVertical * 8,
            width: SizeConfig.blockHorizontal * 80,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),
            child: TextButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/homePage', (route) => false);
                },
                child: const Text('Register',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )))),
      );
    }

    Widget textLogin() {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/loginPage');
        },
        child: Container(
          margin: EdgeInsets.only(
              right: SizeConfig.blockHorizontal * 8,
              top: SizeConfig.blockVertical * 1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: SizeConfig.blockVertical * 89,
                ),
                child: const Text('Login Account Here',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    )),
              ),
              SizedBox(width: SizeConfig.blockHorizontal * 5),
              Container(
                  margin: EdgeInsets.only(top: SizeConfig.blockVertical * 89),
                  child: const Icon(Icons.arrow_forward_ios_rounded,
                      color: Colors.white)),
            ],
          ),
        ),
      );
    }

    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            head(),
            buildContent(),
            textFormField(),
            buttonNavigate(),
            textLogin(),
          ],
        ),
      ),
    );
  }
}
