import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:metadent/routes.dart' as routes;
import '../../../blocs/profile/profile_bloc.dart';
import '../../../models/user.dart';
import '../../../providers/resources/authRepository.dart';
import '../CustomWidgets/CustomSliverAppbarDelegate.dart';
import '../CustomWidgets/InsuranceDetailItem.dart';
import '../CustomWidgets/ProfileFieldItem.dart';
import '../CustomWidgets/ProfilePicture.dart';
import '../CustomWidgets/gradientAppBar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  User loadUser = User();

  var lastName;
  var firstName;
  var email;
  var phone;
  var homeAddress;
  var insurer;
  var policyNumber;

  getUser() async {
    var userJson = await FlutterSecureStorage().read(key: "userData");
    var user = User.fromJson(jsonDecode(userJson!));
    loadUser = user;
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var localizedString = AppLocalizations.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          flexibleSpace: const GradientAppBar(),
          // title: const Text(
          //   "Profile",
          //   style: TextStyle(color: Colors.white),
          // ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body:
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
            //   child:
            BlocProvider(
          create: (context) =>
              ProfileBloc(authRepository: context.read<AuthRepository>()),
          child: BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              if (state is ProfileInitial) {
                context.read<ProfileBloc>().add(ProfileLoad());
              }
              if (kDebugMode) {
                print("builder state is $state");
              }

              if (state is ProfileLoaded) {
                getUser();
                var user = state.loadedUser;
                firstName = user.firstName;
                if (kDebugMode) {
                  print("firstname is ${user.firstName}");
                  print('address is ${user.homeAddress}');
                }
                lastName = user.lastName;
                phone = user.patientPhone;
                email = user.email;
                homeAddress = user.homeAddress;
                insurer = user.patientInsurer;
                policyNumber = user.insurancePolicyNumber;
              }
              return ListView(
                children: [
                  ProfilePicture(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                            vertical: 24.0, horizontal: 16)
                        .r,
                    child:  BlocListener<ProfileBloc, ProfileState>(
                          listener: (context, state) {
                            // TODO: implement listener
                            if (state is ProfileSaved) {
                              var user = state.loadedUser;
                               firstName = user.firstName;
                              if (kDebugMode) {
                                print("firstname is ${user.firstName}");
                                print('address is ${user.homeAddress}');
                              }
                              lastName = user.lastName;
                              phone = user.patientPhone;
                              email = user.email;
                              homeAddress = user.homeAddress;
                              insurer = user.patientInsurer;
                              policyNumber = user.insurancePolicyNumber;
                            }
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 16.0,
                                  bottom: 8.0,
                                ).r,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(localizedString!.profile,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium),
                                    IconButton(
                                      onPressed: ()  {
                                         Navigator.pushNamed(
                                            context, routes.editProfileInfo).then((value){
                                              setState(() {
                                                Navigator.popAndPushNamed(context, routes.profile);
                                              });
                                         });
                                      },
                                      icon: const Icon(Icons.edit),
                                      color: Theme.of(context).primaryColor,
                                    )
                                  ],
                                ),
                              ),
                              ProfileFieldCard(
                                icon: Icons.person,
                                label: localizedString.name,
                                // value: 'Clarissa Hamilton',
                                value: '$firstName $lastName',
                              ),
                              ProfileFieldCard(
                                icon: Icons.email,
                                label: localizedString.email,
                                value: email ?? 'example@email.com',
                              ),
                              ProfileFieldCard(
                                icon: Icons.phone,
                                label: localizedString.phone,
                                value: phone ?? '0700 122 321',
                              ),
                              ProfileFieldCard(
                                icon: Icons.home,
                                label: localizedString.address,
                                value: homeAddress ?? '1 Wampewo Ave, Kampala',
                              ),
                              SizedBox(height: 16.r),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 16.0,
                                  bottom: 8.0,
                                ).r,
                                child: Text(localizedString.insurance,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 16.0).r,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(localizedString.policyDetails,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall),
                                    // IconButton(
                                    //   onPressed: () {
                                    //     Navigator.pushNamed(
                                    //         context, routes.editProfileInfo);
                                    //   },
                                    //   icon: const Icon(Icons.edit),
                                    //   color: Theme.of(context).primaryColor,
                                    // )
                                  ],
                                ),
                              ),
                              Card(
                                elevation: 6,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                            vertical: 16.0)
                                        .r,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        InsuranceDetailRow(
                                            label: localizedString.holderName,
                                            value: '$firstName $lastName',
                                            icon: Icons.person),
                                        Divider(),
                                        InsuranceDetailRow(
                                            label: localizedString.policyNumber,
                                            value:
                                                policyNumber ?? "RID029354856",
                                            icon: Icons.numbers),
                                        Divider(),
                                        InsuranceDetailRow(
                                            label: localizedString.insurer,
                                            value: insurer ?? "Jon Doe",
                                            icon: Icons.business),
                                        //todo uncomment when info gotten
                                        // Divider(),
                                        // InsuranceDetailRow(
                                        //   //todo get the correct fields
                                        //     label: localizedString.coveragePlan,
                                        //     value: "Premium Coverage",
                                        //     icon: Icons.inventory),
                                        // Divider(),
                                        // InsuranceDetailRow(
                                        //   //todo get the expiry date if applicatale
                                        //     label: localizedString.expiry,
                                        //     value: "12 Jun 2024",
                                        //     icon: Icons.calendar_today_rounded),
                                      ],
                                    )),
                              ),
                            ],
                          ),


                    ),

                  ),],
              );
            },
          ),
        ),

        //     CustomScrollView(
        //   slivers: [
        //     SliverPersistentHeader(
        //       delegate: CustomSliverAppBarDelegate(
        //         expandedHeight: 180.h,
        //       ),
        //       pinned: true,
        //     ),
        //     SliverList(
        //       delegate: SliverChildListDelegate([
        //         Padding(
        //           padding:
        //                EdgeInsets.symmetric(vertical: 24.0, horizontal: 16),
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               Padding(
        //                 padding: const EdgeInsets.only(
        //                   left: 16.0,
        //                   bottom: 8.0,
        //                 ).r,
        //                 child: Text('Profile',
        //                     style: Theme.of(context).textTheme.labelMedium),
        //               ),
        //               ProfileFieldCard(
        //                   icon: Icons.person,
        //                   label: 'Name',
        //                   value: 'Clarissa Hamilton',
        //                   editValue: () {
        //                     //todo open edit page/popup
        //                   }),
        //               ProfileFieldCard(
        //                   icon: Icons.email,
        //                   label: 'Email',
        //                   value: 'clarrisa-hamilton@gmail.com',
        //                   editValue: () {
        //                     //todo open edit page/popup
        //                   }),
        //               ProfileFieldCard(
        //                   icon: Icons.phone,
        //                   label: 'Phone',
        //                   value: '0700 122 321',
        //                   editValue: () {
        //                     //todo open edit page/popup
        //                   }),
        //               ProfileFieldCard(
        //                   icon: Icons.home,
        //                   label: 'Address',
        //                   value: '1 Wampewo Ave, Kampala',
        //                   editValue: () {
        //                     //todo open edit page/popup
        //                   }),
        //                SizedBox(height: 16.r),
        //               Padding(
        //                 padding: const EdgeInsets.only(
        //                   left: 16.0,
        //                   bottom: 8.0,
        //                 ).r,
        //                 child: Text('Insurance',
        //                     style: Theme.of(context).textTheme.labelMedium),
        //               ),
        //               Padding(
        //                 padding:  const EdgeInsets.only(left: 16.0).r,
        //                 child: Row(
        //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                   children: [
        //                     Text("Policy Details",
        //                         style: Theme.of(context).textTheme.labelSmall),
        //                     IconButton(
        //                       onPressed: () {
        //                         //todo open edit page
        //                       },
        //                       icon: const Icon(Icons.edit),
        //                       color: Theme.of(context).primaryColor,
        //                     )
        //                   ],
        //                 ),
        //               ),
        //               Card(
        //                 elevation: 6,
        //                 shape: RoundedRectangleBorder(
        //                   borderRadius: BorderRadius.circular(10.r),
        //                 ),
        //                 child: Padding(
        //                   padding: const EdgeInsets.symmetric(vertical: 16.0).r,
        //                   child: Column(
        //                     crossAxisAlignment: CrossAxisAlignment.start,
        //                     children: [
        //                       InsuranceDetailRow(
        //                           label: "holder's name",
        //                           value: "Clarissa Hamilton",
        //                           icon: Icons.person),
        //                       Divider(),
        //                       InsuranceDetailRow(
        //                           label: "Policy Number",
        //                           value: "RID029354856",
        //                           icon: Icons.numbers),
        //                       Divider(),
        //                       InsuranceDetailRow(
        //                           label: "Provider",
        //                           value: "Old Town Insurance",
        //                           icon: Icons.business),
        //                       Divider(),
        //                       InsuranceDetailRow(
        //                           label: "Coverage Plan",
        //                           value: "Premium Coverage",
        //                           icon: Icons.inventory),
        //                       Divider(),
        //                       InsuranceDetailRow(
        //                           label: "Expiry",
        //                           value: "12 Jun 2024",
        //                           icon: Icons.calendar_today_rounded),
        //                     ],
        //                   ),
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ]),
        //     )
        //   ],
        // ),
      ),
    );
  }
}
