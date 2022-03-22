import 'package:flutter/material.dart';

class LongButton extends StatelessWidget {
  const LongButton(
      {Key? key, required this.buttonAction, required this.buttonText})
      : super(key: key);
  final String buttonText;
  final Function? buttonAction;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child:  Text(
        buttonText,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(42),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      onPressed: () {
        buttonAction;
      },
    );
  }
}
