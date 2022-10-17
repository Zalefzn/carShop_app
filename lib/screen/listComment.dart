import 'package:car_shop/models/modelUser.dart';
import 'package:car_shop/utilities/config/sizeConfig.dart';
import 'package:flutter/material.dart';

class ListComment extends StatefulWidget {
  final UserModel user;

  const ListComment(this.user, {Key? key}) : super(key: key);

  @override
  State<ListComment> createState() => _Comment();
}

class _Comment extends State<ListComment> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(children: [
      Center(
        child: Container(
          margin: EdgeInsets.only(
              top: SizeConfig.blockVertical * 2,
              bottom: SizeConfig.blockVertical * 2),
          height: SizeConfig.blockVertical * 9,
          width: SizeConfig.blockHorizontal * 85,
          child: Row(
            children: [
              Container(
                  margin: EdgeInsets.only(left: SizeConfig.blockHorizontal * 2),
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage("${widget.user.avatar}")),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  )),
              SizedBox(width: SizeConfig.blockHorizontal * 3),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "${widget.user.firstName}" +
                          " " +
                          "${widget.user.lastName}",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold)),
                  Text("${widget.user.jobTile}",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.w600)),
                  Text("${widget.user.email}",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.w600)),
                ],
              ),
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(30)),
        ),
      )
    ]);
  }
}
