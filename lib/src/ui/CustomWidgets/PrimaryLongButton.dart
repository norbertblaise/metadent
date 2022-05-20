import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryLongButton extends StatelessWidget {
  const PrimaryLongButton(
      {Key? key, required this.buttonAction, required this.buttonText})
      : super(key: key);
  final String buttonText;
  final void Function()? buttonAction;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child:  Text(
        buttonText,
        style:  TextStyle(
          color: Colors.white,
          fontSize: 16.0.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(42),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8).r)),
      onPressed:
        buttonAction

    );
  }
}
