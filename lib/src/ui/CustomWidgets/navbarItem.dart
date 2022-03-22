import 'package:flutter/material.dart';

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
      height: 40,
      width: 40,
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
          size: 32,
        ),
      ),
    );
  }
}