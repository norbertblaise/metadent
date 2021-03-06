import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:metadent/providers/resources/authRepository.dart';
import 'package:metadent/src/ui/CustomWidgets/AppointmentListItem.dart';
import 'package:metadent/src/ui/CustomWidgets/gradientAppBar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:metadent/routes.dart' as routes;

import '../../../app.dart';
import '../../../blocs/Appointments/appointments_bloc.dart';
import '../../../models/appointment/appointmentsList.dart';

var localizedString =
    AppLocalizations.of(NavigationService.navigatorKey.currentContext!);

class AppointmentsPage extends StatefulWidget {
  const AppointmentsPage({Key? key}) : super(key: key);

  @override
  State<AppointmentsPage> createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage>
    with SingleTickerProviderStateMixin {
  final tabs = [localizedString!.upcoming, localizedString!.previous];
  late TabController _tabController;
  AppointmentsList appointmentsList = AppointmentsList(appointments: []);
  final FlutterSecureStorage storage = FlutterSecureStorage();
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
        title: Text(
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
        actions: [
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
      body: BlocProvider(
        create: (context) =>
            AppointmentsBloc(authRepository: context.read<AuthRepository>()),
        child: TabBarView(
          controller: _tabController,
          children: [
            for (final tab in tabs)
              BlocBuilder<AppointmentsBloc, AppointmentsState>(
                builder: (context, state) {
                  if (kDebugMode) {
                    print("state in tab is $state");
                  }
                  if( state is AppointmentsInitial){
                    context.read<AppointmentsBloc>().add(FetchAppointments());
                  }
                  if(state is AppointmentsFetched){
                    appointmentsList = state.appointmentsList;
                  }
                  return
                    // state is AppointmentsInitial?
                    //   ? Center(child: CircularProgressIndicator())
                    //   :
                  ListView(
                          children: [
                            AppointmentListItem(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, routes.appointmentDetails);
                                },
                                appointmentName: localizedString.ongoingControl,
                                doctorName: 'Brandon Wavamuno',
                                date: '11/04/2022',
                                time: '10:00'),
                          ],
                        );
                },
              ),
          ],
        ),
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
            label: Text(
              localizedString!.newFABLabel,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r)),
            onPressed: () {
              Navigator.pushNamed(context, routes.newAppointment);
            },
          )
        : Container();
  }
}
