import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'CustomWidgets/SettingsListItem.dart';
import 'CustomWidgets/gradientAppBar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:metadent/routes.dart' as routes;

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var localizedString = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // flexibleSpace: const GradientAppBar(),
        title:  Text(
         localizedString!.accountOptions,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0).r,
        child: ListView(
          children: [
            SettingsListItem(
              label: localizedString.personalInformation,
              icon: Icons.manage_accounts_outlined,
              onTap: () {
                Navigator.pushNamed(context, routes.profile);
              },
            ),
            SettingsListItem(
              label: localizedString.paymentMethods,
              icon: Icons.payment_rounded,
              onTap: () {
                Navigator.pushNamed(context, routes.paymentMethods);
              },
            ),
            SettingsListItem(
              label: localizedString.settings,
              icon: Icons.settings_outlined,
              onTap: () {},
            ),
            SettingsListItem(
              label: localizedString.language,
              icon: Icons.language_outlined,
              onTap: () {},
            ),
            SettingsListItem(
              label: localizedString.support,
              icon: Icons.support,
              onTap: () {},
            ),
            SettingsListItem(
              label: localizedString.logout,
              icon: Icons.logout,
              onTap: () {
                // Navigator.popAndPushNamed(context, routes.loginPage);
                Navigator.pushNamedAndRemoveUntil(context, routes.loginPage, (route)=> false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
