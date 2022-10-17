import 'package:car_shop/models/modelCar.dart';
import 'package:car_shop/providers/wishList_provider.dart';
import 'package:car_shop/utilities/config/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishCard extends StatefulWidget {
  final CarModel carModel;
  const WishCard(this.carModel, {Key? key}) : super(key: key);

  @override
  State<WishCard> createState() => _Card();
}

class _Card extends State<WishCard> {
  @override
  Widget build(BuildContext context) {
    WishListProvider wishListProvider = Provider.of<WishListProvider>(context);

    SizeConfig().init(context);
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: SizeConfig.blockVertical * 4),
          height: SizeConfig.blockVertical * 10,
          width: SizeConfig.blockHorizontal * 90,
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: SizeConfig.blockHorizontal * 3),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(width: SizeConfig.blockHorizontal * 3),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.carModel.car,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      )),
                  Text(widget.carModel.price,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      )),
                ],
              ),
              GestureDetector(
                onTap: () {
                  wishListProvider.setProductCar(widget.carModel);
                },
                child: Container(
                  margin:
                      EdgeInsets.only(left: SizeConfig.blockHorizontal * 36),
                  child: Image.asset(
                    'assets/love2.png',
                    width: 30,
                  ),
                ),
              )
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ],
    );
  }
}
