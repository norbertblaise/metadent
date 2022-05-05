import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Methods/methods.dart';

class DetailTextField extends StatelessWidget {
  const DetailTextField({
    Key? key,
    required this.textEditingController,
    required this.hintText,
    required this.labelText,
    required this.errorText,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final String hintText;
  final String labelText;
  final String errorText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        fontSize: 16.sp,
        color: Theme.of(context).accentColor,
      ),
      controller: textEditingController,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value?.length == 0) {
          return errorText;
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        label: Text(
          labelText,
          style: TextStyle(
            color: Theme.of(context).accentColor,
            fontSize: 18.sp,
          ),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 16.sp,
        ),
        filled: true,
        focusedBorder: buildInputBorder(),
        errorBorder: buildInputBorder(),
        border: buildInputBorder(),
        enabledBorder: buildInputBorder(),
      ),
    );
  }
}
