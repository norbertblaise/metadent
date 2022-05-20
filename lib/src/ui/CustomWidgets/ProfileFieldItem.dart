import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileFieldCard extends StatelessWidget {
  IconData? icon;
  String label;
  String value;
  // Function()? editValue;

  ProfileFieldCard({
    required this.icon, required this.label,
    required this.value,
    // required this.editValue,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric( vertical: 12).r,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0).r,
              child: Row(children: [
                Icon(icon, size: 30.r, color: Theme.of(context).hintColor),
                 SizedBox(
                  width: 30.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Theme.of(context).hintColor,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                     SizedBox(
                      height: 6.h,
                    ),
                    Text(
                      value,
                      style: TextStyle(
                          fontSize: 14.sp, color: Theme.of(context).accentColor),
                    ),
                  ],),
              ],),
            ),
            // IconButton(
            //   onPressed: editValue, icon: const Icon(Icons.edit),
            //   color: Theme.of(context).primaryColor,
            // )
          ],
        ),
      ),
    );
  }
}

