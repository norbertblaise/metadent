import 'package:flutter/material.dart';

class SigninSignupHeader extends StatelessWidget {
  const SigninSignupHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: const [
        SizedBox(
          width: double.infinity,
          height: 420,
          child: Image(
            image: AssetImage('assets/images/Login background.png'),
            fit: BoxFit.fill,
          ),
        ),
        Image(
          image: AssetImage('assets/images/header-illustration.png'),
          fit: BoxFit.contain,
        ),
      ],
    );
  }
}