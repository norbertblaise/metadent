import 'dart:ui';
import 'package:metadent/src/ui/CustomWidgets/navbarItem.dart';
import 'package:metadent/src/ui/account.dart';
import 'package:metadent/src/ui/communications.dart';
import 'package:metadent/src/ui/homePage.dart';
import 'package:metadent/src/ui/Invoices/invoicesPage.dart';
import 'package:metadent/src/ui/notifications.dart';
import 'package:metadent/src/ui/dashboard.dart';
import '../ui/CustomWidgets/serviceCard.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage() : super();

  // final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  int pageIndex = 0;

  final pages = [
    Dashboard(),
    const Communications(),
    const InvoicesPage(),
    const Notifications(),
    const Account()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: pages[pageIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
        ),
        child: buildBottomNavbar(context),
      ),
    );
  }

  Container buildBottomNavbar(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          NavbarItem(
            icon: Icons.home_outlined,
            pageIndex: pageIndex,
            iconIndex: 0,
            iconDestination: () {
              setState(() {
                pageIndex = 0;
              });
            },
          ),
          NavbarItem(
            icon: Icons.forum_outlined,
            pageIndex: pageIndex,
            iconIndex: 1,
            iconDestination: () {
              setState(() {
                pageIndex = 1;
              });
            },
          ),
          NavbarItem(
            icon: Icons.receipt_long_outlined,
            pageIndex: pageIndex,
            iconIndex: 2,
            iconDestination: () {
              setState(() {
                pageIndex = 2;
              });
            },
          ),
          NavbarItem(
            icon: Icons.notifications_outlined,
            pageIndex: pageIndex,
            iconIndex: 3,
            iconDestination: () {
              setState(() {
                pageIndex = 3;
              });
            },
          ),
          NavbarItem(
            icon: Icons.person_outlined,
            pageIndex: pageIndex,
            iconIndex: 4,
            iconDestination: () {
              setState(() {
                pageIndex = 4;
              });
            },
          ),
        ],
      ),
    );
  }
}
