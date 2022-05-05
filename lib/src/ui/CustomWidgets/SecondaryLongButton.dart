import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecondaryLongButton extends StatelessWidget {
  const SecondaryLongButton(
      {Key? key, required this.buttonAction, required this.buttonText})
      : super(key: key);
  final String buttonText;
  final Function? buttonAction;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      child:  Text(
        buttonText,
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: 16.0.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(42),
          side: BorderSide(width: 1.5.w, color: Theme.of(context).primaryColor),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8).r,
          )),
      onPressed: () {
        buttonAction;
      },
    );
  }
}