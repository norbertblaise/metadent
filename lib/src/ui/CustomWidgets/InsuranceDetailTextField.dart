import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Methods/methods.dart';

class DetailTextField extends StatelessWidget {
  const DetailTextField(
      {Key? key,
      required this.textEditingController,
      required this.hintText,
      required this.labelText,
      required this.errorText,
      required this.onChanged,
      this.validator,
      this.initialValue})
      : super(key: key);

  final TextEditingController textEditingController;
  final String hintText;
  final String labelText;
  final String errorText;
  final String? initialValue;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        fontSize: 16.sp,
        color: Theme.of(context).accentColor,
      ),
      initialValue: initialValue,
      controller: textEditingController,
      keyboardType: TextInputType.text,
      validator: validator ??
          (value) {
            if (value?.length == 0) {
              return errorText;
            } else {
              return null;
            }
          },
      onChanged: onChanged,
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
