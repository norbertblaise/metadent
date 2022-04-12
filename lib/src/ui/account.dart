import 'package:flutter/material.dart';

import 'CustomWidgets/SettingsListItem.dart';
import 'CustomWidgets/gradientAppBar.dart';
import 'package:metadent/routes.dart' as routes;

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // flexibleSpace: const GradientAppBar(),
        title: const Text(
          "Account Options",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: ListView(
          children: [
            SettingsListItem(
              label: 'Personal Information',
              icon: Icons.manage_accounts_outlined,
              onTap: () {
                Navigator.pushNamed(context, routes.profile);
              },
            ),
            SettingsListItem(
              label: 'Payment Methods',
              icon: Icons.payment_rounded,
              onTap: () {},
            ),
            SettingsListItem(
              label: 'Settings',
              icon: Icons.settings_outlined,
              onTap: () {},
            ),
            SettingsListItem(
              label: 'Language',
              icon: Icons.language_outlined,
              onTap: () {},
            ),
            SettingsListItem(
              label: 'Support',
              icon: Icons.support,
              onTap: () {},
            ),
            SettingsListItem(
              label: 'Logout',
              icon: Icons.logout,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
