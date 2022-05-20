import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metadent/blocs/formSubmissionStatus.dart';
import 'package:metadent/providers/resources/authRepository.dart';
import 'package:metadent/routes.dart' as routes;
import 'package:metadent/app.dart';
import 'package:metadent/src/ui/CustomWidgets/PrimaryLongButton.dart';

import '../../../blocs/profile/profile_bloc.dart';
import '../CustomWidgets/InsuranceDetailTextField.dart';
import '../Methods/methods.dart';

class EditProfileInfo extends StatefulWidget {
  const EditProfileInfo({Key? key}) : super(key: key);

  @override
  State<EditProfileInfo> createState() => _EditProfileInfoState();
}

class _EditProfileInfoState extends State<EditProfileInfo> {
  final _formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController(
      /*todo get name from API*/
      // text: "Clarissa Hamilton"
      );
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final policyNumberController = TextEditingController();
  final providerController = TextEditingController();
  final planController = TextEditingController(text: "Premium Coverage");
  final expiryController = TextEditingController(text: "12 Jun 2024");

  void _showSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          localizedString!.profile,
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: BlocProvider(
        create: (context) =>
            ProfileBloc(authRepository: context.read<AuthRepository>()),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8).r,
          child: BlocListener<ProfileBloc, ProfileState>(
            listener: (context, state) {
              final formStatus = state.formStatus;
              if (kDebugMode) {
                print("Editprofile state at top is $state");
              }
              if(formStatus is SubmissionSuccess){
                _showSnackbar(context, "ProfileSaved");
              }
              else if (formStatus is SubmissionFailed) {
                _showSnackbar(context, "Error: Profile not saved");
              }
              if (state is ProfileSaved) {
                Navigator.pop(context);
              }
            },
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  SizedBox(
                    height: 16.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0).r,
                    child: Text(
                      localizedString!.editProfileInfo,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0).r,
                    child: Text(
                      localizedString!.personalInformation,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Card(
                    elevation: 6.h,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0).r,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                              left: 16.0, right: 16.0, top: 25, bottom: 18.0)
                          .r,
                      child: BlocBuilder<ProfileBloc, ProfileState>(
                        builder: (context, state) {
                          final formStatus = state.formStatus;

                          if (state is ProfileInitial) {
                            context.read<ProfileBloc>().add(ProfileLoad());
                          }
                          if (kDebugMode) {
                            print("EditProfile Profile state is $state");
                            print("form status $formStatus");
                            // print("firstname is ${user.firstName}");
                          }

                          if (state is ProfileLoaded) {
                            var user = state.loadedUser;
                            String firstName = user.firstName;
                            if (kDebugMode) {
                              print(
                                  "EditProfile  Column Profile state is $state");
                              // print("firstname is ${user.firstName}");
                            }
                            String lastName = user.lastName;
                            var phone = user.patientPhone;
                            var homeAddress = user.homeAddress;
                            var insurer = user.patientInsurer;
                            var policyNumber = user.insurancePolicyNumber;

                            firstNameController.text = firstName;
                            lastNameController.text = lastName;
                            phone != null
                                ? phoneController.text = phone
                                : phoneController.text = "";
                            homeAddress != null
                                ? addressController.text = homeAddress
                                : addressController.text = "";
                            insurer != null
                                ? providerController.text = insurer
                                : providerController.text = "";
                            policyNumber != null
                                ? policyNumberController.text = policyNumber
                                : providerController.text = "";
                          }
                          return Column(
                            children: [
                              DetailTextField(
                                hintText: localizedString!.nameHint,
                                errorText: localizedString!.noNameError,
                                labelText: localizedString!.firstName,
                                textEditingController: firstNameController,
                                validator: (value) =>
                                    state.isFirstNameValid(value!)
                                        ? null
                                        : 'Required field',
                                onChanged: (value) {
                                  context.read<ProfileBloc>().add(
                                      ProfileFirstNameChanged(
                                          firstName: value));
                                },
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              DetailTextField(
                                //todo change hint and label to lastname string
                                hintText: localizedString!.nameHint,
                                errorText: localizedString!.noNameError,
                                labelText: localizedString!.lastName,
                                validator: (value) =>
                                    state.isLastNameValid(value!)
                                        ? null
                                        : 'Required field',
                                textEditingController: lastNameController,
                                onChanged: (value) {
                                  context.read<ProfileBloc>().add(
                                      ProfileLastNameChanged(lastName: value));
                                },
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              DetailTextField(
                                hintText: localizedString!.phoneHint,
                                errorText: localizedString!.noNameError,
                                labelText: localizedString!.phone,
                                validator: (value) => state.isPhoneValid(value!)
                                    ? null
                                    : 'Required field',
                                textEditingController: phoneController,
                                onChanged: (value) {
                                  context.read<ProfileBloc>().add(
                                      ProfilePhoneChanged(phoneNumber: value));
                                },
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              DetailTextField(
                                hintText: localizedString!.address,
                                errorText: localizedString!.noNameError,
                                labelText: localizedString!.address,
                                validator: (value) =>
                                    state.isHomeAddressValid(value!)
                                        ? null
                                        : 'Required field',
                                textEditingController: addressController,
                                onChanged: (value) {
                                  context.read<ProfileBloc>().add(
                                      ProfileHomeAddressChanged(
                                          homeAddress: value));
                                },
                              ),
                              SizedBox(
                                height: 16.h,
                              ),

                              // BlocBuilder<ProfileBloc, ProfileState>(
                              //   builder: (context, state) {
                              //     return
                              //     DetailTextField(
                              //         hintText: localizedString!.nameHint,
                              //         errorText: localizedString!.noNameError,
                              //         labelText: localizedString!.holderName,
                              //         textEditingController: nameController);
                              //   },
                              // ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0).r,
                    child: Text(
                      localizedString!.policyDetails,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Card(
                    elevation: 6.h,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0).r,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                              left: 16.0, right: 16.0, top: 25, bottom: 18.0)
                          .r,
                      child: Column(
                        children: [
                          BlocBuilder<ProfileBloc, ProfileState>(
                            builder: (context, state) {
                              // var user = state.loadedUser;

                              return DetailTextField(
                                hintText: localizedString!.nameHint,
                                errorText: localizedString!.policyNumberError,
                                labelText: localizedString!.policyNumber,
                                validator: (value) =>
                                    state.isPolicyNumberValid(value!)
                                        ? null
                                        : 'Required field',
                                textEditingController: policyNumberController,
                                onChanged: (value) => context
                                    .read<ProfileBloc>()
                                    .add(ProfilePolicyNumberChanged(
                                        policyNumber: value)),
                              );
                            },
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          BlocBuilder<ProfileBloc, ProfileState>(
                            builder: (context, state) {
                              return DetailTextField(
                                hintText: localizedString!.providerHint,
                                errorText: localizedString!.providerError,
                                labelText: localizedString!.insurer,
                                validator: (value) =>
                                    state.isInsurerValid(value!)
                                        ? null
                                        : 'Required field',
                                textEditingController: providerController,
                                onChanged: (value) => context
                                    .read<ProfileBloc>()
                                    .add(ProfileInsurerChanged(insurer: value)),
                              );
                            },
                          ),

                          // DetailTextField(
                          //     hintText: localizedString!.coveragePlan,
                          //     errorText: localizedString!.coveragePlanError,
                          //     labelText: localizedString!.coveragePlan,
                          //     textEditingController: planController),
                          // SizedBox(
                          //   height: 16.h,
                          // ),
                          // DetailTextField(
                          //     hintText: localizedString!.expiry,
                          //     errorText: localizedString!.policyNumberError,
                          //     labelText: localizedString!.expiry,
                          //     textEditingController: expiryController),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  BlocBuilder<ProfileBloc, ProfileState>(
                    builder: (context, state) {
                      return state.formStatus is FormSubmitting
                          ? Column(
                            children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        height: 18.h,
                                        width: 18.w,
                                        child: CircularProgressIndicator()),
                                  ],
                                ),
                              SizedBox(
                                height: 10.h,
                              )
                            ],
                          )
                          : PrimaryLongButton(
                              buttonAction: () {
                                //todo save changes insurance details
                                if (_formKey.currentState!.validate()) {
                                  context.read<ProfileBloc>().add(
                                      ProfileSaveButtonPressed(
                                          firstName: firstNameController.text,
                                          lastName: lastNameController.text,
                                          phone: phoneController.text,
                                          homeAddress: addressController.text,
                                          insurer: providerController.text,
                                          policyNumber:
                                              policyNumberController.text));

                                  if (kDebugMode) {
                                    print("EditProflieInfo state is $state`");
                                  }
                                }
                              },
                              buttonText: localizedString!.save.toUpperCase());
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
