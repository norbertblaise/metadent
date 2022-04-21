import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(const App());
}

