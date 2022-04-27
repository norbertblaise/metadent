import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metadent/src/ui/CustomWidgets/AppointmentListItem.dart';
import 'package:metadent/src/ui/CustomWidgets/gradientAppBar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:metadent/routes.dart' as routes;

import '../../../app.dart';
var localizedString = AppLocalizations.of(NavigationService.navigatorKey.currentContext!);

class Appointments extends StatefulWidget {
  const Appointments({Key? key}) : super(key: key);

  @override
  State<Appointments> createState() => _AppointmentsState();
}

class _AppointmentsState extends State<Appointments>
    with SingleTickerProviderStateMixin {

  final tabs = [localizedString!.upcoming, localizedString!.previous];
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabIndex);
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabIndex);
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabIndex() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var localizedString = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: const GradientAppBar(),
        title:  Text(
          localizedString!.appointments,
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Navigator.pushNamed(context, routes.dashboard);
            Navigator.pop(context);
          },
        ),
        actions:  [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
            ).r,
            child: Icon(Icons.search, color: Colors.white),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.white,
          indicatorColor: Colors.white,
          isScrollable: true,
          tabs: [
            for (final tab in tabs)
              SizedBox(
                width: 0.4.sw,
                child: Tab(text: tab),
              ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          for (final tab in tabs)
            ListView(
              children: [
                AppointmentListItem(
                    appointmentName: localizedString.ongoingControl,
                    doctorName: 'Brandon Wavamuno',
                    date: '11/04/2022',
                    time: '10:00'),
              ],
            ),
        ],
      ),
      floatingActionButton: _floatingButtons(),
    );
  }

  Widget _floatingButtons() {
    var localizedString = AppLocalizations.of(context);
    return _tabController.index == 0
        ? FloatingActionButton.extended(
            backgroundColor: Theme.of(context).primaryColor,
            foregroundColor: Colors.white,
            icon: const Icon(Icons.add),
            label:  Text(
              localizedString!.newFABLabel,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
            onPressed: () {
              Navigator.pushNamed(context, routes.newAppointment);
            },
          )
        : Container();
  }
}
