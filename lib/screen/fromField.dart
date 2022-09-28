import 'package:car_shop/utilities/config/sizeConfig.dart';
import 'package:flutter/material.dart';

class FromField extends StatefulWidget {
  final bool scureText;
  final String hintText;

  const FromField(this.scureText, this.hintText, {Key? key}) : super(key: key);

  @override
  State<FromField> createState() => _From();
}

class _From extends State<FromField> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: const EdgeInsets.only(left: 35),
      height: SizeConfig.blockVertical * 8,
      width: SizeConfig.blockHorizontal * 80,
      child: TextFormField(
        obscureText: widget.scureText,
        style: const TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.grey[700]),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.white,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}
