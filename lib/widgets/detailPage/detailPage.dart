import 'package:car_shop/models/modelCar.dart';
import 'package:car_shop/providers/userProvider.dart';
import 'package:car_shop/providers/wishList_provider.dart';
import 'package:car_shop/screen/listComment.dart';
import 'package:car_shop/utilities/config/sizeConfig.dart';
import 'package:car_shop/widgets/wishList/transaction.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  final CarModel carModel;

  const DetailPage(this.carModel, {Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _Detail();
}

class _Detail extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    var getDataCar = widget.carModel.car;
    WishListProvider wishListProvider = Provider.of<WishListProvider>(context);
    UserProvider userProvider = Provider.of<UserProvider>(context);

    Widget contentHead() {
      return Stack(
        children: [
          Center(
            child: Container(
                margin: EdgeInsets.only(top: SizeConfig.blockVertical * 4),
                height: SizeConfig.blockVertical * 40,
                width: SizeConfig.blockHorizontal * 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey.shade300,
                ),
                child: Center(
                  child: Text(getDataCar,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                )),
          ),
          Container(
              margin: EdgeInsets.only(
                  top: SizeConfig.blockVertical * 6,
                  left: SizeConfig.blockHorizontal * 75),
              height: 30,
              width: 30,
              child: GestureDetector(
                onTap: () {
                  wishListProvider.setProductCar(widget.carModel);

                  if (wishListProvider.isWishlist(widget.carModel)) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.green,
                      content: Text(
                        'Has Been Added',
                        textAlign: TextAlign.center,
                      ),
                    ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(
                        'Has Been Removed',
                        textAlign: TextAlign.center,
                      ),
                    ));
                  }
                },
                child: Image.asset(wishListProvider.isWishlist(widget.carModel)
                    ? 'assets/love2.png'
                    : 'assets/love1.png'),
              )),
        ],
      );
    }

    Widget descriptionData() {
      return Container(
        margin: EdgeInsets.only(
            left: SizeConfig.blockHorizontal * 10,
            top: SizeConfig.blockVertical * 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: const Text(
                'Description :',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: SizeConfig.blockVertical * 2),
            Container(
              child: Text(
                  'car : ${widget.carModel.car}\nmodel : ${widget.carModel.carModel}\ncolor : ${widget.carModel.carColor}\nyear : ${widget.carModel.carModelYear.toString()}\nprice : ${widget.carModel.price}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  )),
            ),
            SizedBox(height: SizeConfig.blockVertical * 2),
            Container(
              child: const Text(
                'Sales :',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: SizeConfig.blockVertical * 1),
          ],
        ),
      );
    }

    Widget listComen() {
      return Container(
        height: SizeConfig.blockVertical * 30,
        child: ListView(
          scrollDirection: Axis.vertical,
          children:
              userProvider.users.map((user) => ListComment(user)).toList(),
        ),
      );
    }

    Widget buttonRoute() {
      return Column(
        children: [
          Container(
              margin: EdgeInsets.only(
                  top: SizeConfig.blockVertical * 2,
                  bottom: SizeConfig.blockHorizontal * 4),
              height: SizeConfig.blockVertical * 9,
              width: SizeConfig.blockHorizontal * 85,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.black,
              ),
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OrderList()));
                  },
                  child: const Text('Order',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold)))),
        ],
      );
    }

    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            contentHead(),
            descriptionData(),
            listComen(),
            buttonRoute(),
          ],
        ),
      ),
    );
  }
}
