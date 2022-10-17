import 'package:car_shop/providers/wishList_provider.dart';
import 'package:car_shop/screen/wishCard.dart';
import 'package:car_shop/utilities/config/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishList extends StatefulWidget {
  const WishList({Key? key}) : super(key: key);

  @override
  State<WishList> createState() => _Wish();
}

class _Wish extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    WishListProvider wishListProvider = Provider.of<WishListProvider>(context);
    bool isDataDone = false;

    Widget content() {
      return Container(
          height: SizeConfig.blockVertical * 100,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 60,
                  width: 60,
                  child: const Icon(Icons.add_circle_outline_sharp, size: 60)),
              SizedBox(height: SizeConfig.blockVertical * 2),
              const Text('Opss! Your Cart is Empty',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  )),
              SizedBox(height: SizeConfig.blockVertical * 2),
              const Text('Lets find your favorite cars',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  )),
              SizedBox(height: SizeConfig.blockVertical * 3),
              Center(
                child: Container(
                    height: SizeConfig.blockVertical * 8,
                    width: SizeConfig.blockHorizontal * 50,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(30)),
                    child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/homePage');
                        },
                        child: const Text('Explore Store',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )))),
              )
            ],
          ));
    }

    Widget cartFull() {
      return ListView(
        scrollDirection: Axis.vertical,
        children: wishListProvider.wishList
            .map((carModel) => WishCard(carModel))
            .toList(),
      );
    }

    showContent() {
      if (isDataDone != false) {
        return content();
      } else {
        if (isDataDone == false) {
          return cartFull();
        }
      }
    }

    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.black,
              title: const Center(
                child: Text('Favorite Cars',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
              )),
          body: showContent()),
    );
  }
}
