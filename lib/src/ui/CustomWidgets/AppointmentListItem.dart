import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentListItem extends StatelessWidget {
  final String appointmentName;
  final String doctorName;
  final String date;
  final String time;
  final Image? doctorProfilePic;
  final Function()? onTap;

  const AppointmentListItem(
      {Key? key,
        required this.doctorName,
        required this.date,
        required this.time, required this.appointmentName,
        this.doctorProfilePic,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0).r,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                 CircleAvatar(
                  radius: ScreenUtil().radius(25),
                  //todo change to profile pic otherwise use placeholder
                  backgroundImage:
                  const AssetImage('assets/images/default-profile-pic.png'),
                ),
                 SizedBox(width: ScreenUtil().setWidth(8)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(appointmentName,
                        style: Theme.of(context).textTheme.titleSmall),
                     SizedBox(height: 4.h),
                    Text(
                      doctorName,
                      style: TextStyle(
                        color: Theme.of(context).hintColor,
                        fontSize: 16.sp,
                        fontFamily: 'Source Sans Pro',
                      ),
                    ),
                     SizedBox(height: 4.h),
                    Text('$date, $time',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                        fontFamily: 'Source Sans Pro',
                      ),),
                  ],
                ),
              ],
            ),
            IconButton(
                icon:  Icon(
                  Icons.chevron_right,
                  size: 30.r,
                ),
                onPressed: () {})
          ],
        ),
      ),
    );
  }
}