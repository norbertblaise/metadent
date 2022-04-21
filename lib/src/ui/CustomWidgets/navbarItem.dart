import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavbarItem extends StatelessWidget {
  final IconData icon;
  final void Function()? iconDestination;
  final int pageIndex;
  final int iconIndex;

  const NavbarItem(
      {required this.icon,
        required this.iconDestination,
        required this.pageIndex,
        required this.iconIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: ScreenUtil().setHeight(40),
      width: ScreenUtil().setWidth(40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        color: pageIndex == iconIndex
            ? Theme.of(context).primaryColor
            : Colors.white,
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: iconDestination,
        icon: Icon(
          icon,
          color: pageIndex == iconIndex
              ? Colors.white
              : Theme.of(context).accentColor,
          size: 30.w,
        ),
      ),
    );
  }
}