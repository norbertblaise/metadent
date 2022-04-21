import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metadent/routes.dart' as routes;
import 'package:metadent/src/ui/CustomWidgets/gradientAppBar.dart';
import 'package:intl/intl.dart';
import 'package:metadent/src/ui/CustomWidgets/LongButton.dart';

class NewAppointment extends StatefulWidget {
  const NewAppointment({Key? key}) : super(key: key);

  @override
  State<NewAppointment> createState() => _NewAppointmentState();
}

class _NewAppointmentState extends State<NewAppointment> {
  String dropdownValue = "Consulation";
  late List<bool> isSelected;
  int defaultChoiceChip = 0;
  late List _timeChoices;
  DateTime selectedDate = DateTime.now();

  var treatmentItems = [
    'Consulation',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  _selectDate(BuildContext context) async {
    final ThemeData theme = Theme.of(context);
    assert(theme.platform != null);
    switch (theme.platform) {
      case TargetPlatform.android:
        return buildMaterialDatePicker(context);
      case TargetPlatform.iOS:
        return buildCupertinoDatePicker(context);
    }
  }

  buildMaterialDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      // Refer step 1
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
      helpText: "Select Appointment Date",
      cancelText: "Cancel",
      confirmText: "Confirm",
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  buildCupertinoDatePicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            height: MediaQuery
                .of(context)
                .copyWith()
                .size
                .height / 3,
            color: Colors.white,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (picked) {
                if (picked != null && picked != selectedDate) {
                  setState(() {
                    selectedDate = picked;
                  });
                }
              },
              initialDateTime: DateTime.now(),
              minimumYear: 2000,
              maximumDate: DateTime(2050),
            ),
          );
        });
  }

  @override
  void initState() {
    isSelected = [true, false, false];
    super.initState();
    _timeChoices = ['08:00', '09:00', '10:00', '11:00'];
  }

  Widget timeChips() {
    return Wrap(
      spacing: 8.w,
      children: List.generate(_timeChoices.length, (index) {
        return ChoiceChip(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.r),
          ),
          label: Text(_timeChoices[index]),
          selected: defaultChoiceChip == index,
          selectedColor: Theme
              .of(context)
              .primaryColor,
          onSelected: (bool selected) {
            setState(() {
              defaultChoiceChip = (selected ? index : null)!;
            });
          },
          backgroundColor: Theme
              .of(context)
              .primaryColor
              .withOpacity(0.60),
          labelStyle: const TextStyle(
            color: Colors.white,
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // flexibleSpace: const GradientAppBar(),
        title: const Text(
          "Book Appointment",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0).r,
        child: Stack(
          children:
          [ Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 16.0,
                ).r,
                child: Text(
                  "Pick a date",
                  style: Theme
                      .of(context)
                      .textTheme
                      .labelSmall,
                ),
              ),
              Card(
                elevation: 6.h,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0.r),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, top: 16, bottom: 16, right: 8).r,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            DateFormat.yMMMMd().format(selectedDate),
                            style: TextStyle(
                              fontSize: 34.sp,
                              fontFamily: "Montserrat",
                              color: Theme
                                  .of(context)
                                  .accentColor,
                            ),
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.date_range,
                                color: Theme
                                    .of(context)
                                    .accentColor,
                                size: 30.w,
                              ),
                              onPressed: () {
                                //todo open date picker
                                _selectDate(context);
                              }),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
               SizedBox(
                height: 25.h,
              ),
              Padding(
                padding:  const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 16.0,
                ).r,
                child: Text("Pick a treatment",
                    style: Theme
                        .of(context)
                        .textTheme
                        .labelSmall),
              ),
              Card(
                elevation: 6.h,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0.r),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16).r,
                  child: DropdownButton(
                    isExpanded: true,
                    value: dropdownValue,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Source Sans Pro',
                      fontSize: 22.sp,
                      color: Theme
                          .of(context)
                          .accentColor,
                    ),
                    icon: Icon(Icons.expand_more,
                        color: Theme
                            .of(context)
                            .accentColor),
                    items: treatmentItems.map((String items) {
                      return DropdownMenuItem(value: items, child: Text(items));
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                  ),
                ),
              ),
               SizedBox(
                height: 25.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 16.0,
                ).r,
                child: Text("Pick a time",
                    style: Theme
                        .of(context)
                        .textTheme
                        .labelSmall),
              ),
              Card(
                elevation: 6.h,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0.r),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 16.0,
                  ).r,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: double.infinity),
                      ToggleButtons(
                        color: Colors.black.withOpacity(0.60),
                        selectedColor: Theme
                            .of(context)
                            .primaryColor,
                        selectedBorderColor: Theme
                            .of(context)
                            .primaryColor,
                        splashColor:
                        Theme
                            .of(context)
                            .primaryColor
                            .withOpacity(0.12),
                        borderRadius: BorderRadius.circular(4.0.r),
                        constraints: BoxConstraints(minHeight: 36.h),
                        isSelected: isSelected,
                        onPressed: (int index) {
                          setState(() {
                            for (int i = 0; i < isSelected.length; i++) {
                              isSelected[i] = i == index;
                            }
                          });
                        },
                        children:  [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0).r,
                            child: Text('Morning'),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0).r,
                            child: Text('Mid'),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0).r,
                            child: Text('Afternoon'),
                          ),
                        ],
                      ),
                      timeChips(),
                    ],
                  ),
                ),
              ),

            ],
          ),
            Align(
              alignment: Alignment.bottomCenter,
              child: LongButton(
                buttonText: "Confirm",buttonAction: (){
                //todo handle appointment creation
              },
              ),
            )
        ],
        ),
      ),
    );
  }
}


         