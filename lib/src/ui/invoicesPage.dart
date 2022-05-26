import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app.dart';
import 'CustomWidgets/InvoiceCard.dart';

class InvoicesPage extends StatelessWidget {
  const InvoicesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        // flexibleSpace: const GradientAppBar(),
        title: Text(
          // localizedString!.accountOptions,
          "Invoices",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0).r,
            child: InvoiceCard(),
          )
        ],
      ),
    );
  }
}


