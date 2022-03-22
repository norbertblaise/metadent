import 'package:flutter/material.dart';

class AppointmentListItem extends StatelessWidget {
  final String appointmentName;
  final String doctorName;
  final String date;
  final String time;
  final Image? doctorProfilePic;

  const AppointmentListItem(
      {Key? key,
        required this.doctorName,
        required this.date,
        required this.time, required this.appointmentName, this.doctorProfilePic})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 25,
                  //todo change to profile pic otherwise use placeholder
                  backgroundImage:
                  AssetImage('assets/images/default-profile-pic.png'),
                ),
                const SizedBox(width: 8.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(appointmentName,
                        style: Theme.of(context).textTheme.titleSmall),
                    const SizedBox(height: 4.0),
                    Text(
                      doctorName,
                      style: TextStyle(
                        color: Theme.of(context).hintColor,
                        fontSize: 16,
                        fontFamily: 'Source Sans Pro',
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text('$date, $time',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        fontFamily: 'Source Sans Pro',
                      ),),
                  ],
                ),
              ],
            ),
            IconButton(
                icon: const Icon(
                  Icons.chevron_right,
                  size: 30,
                ),
                onPressed: () {})
          ],
        ),
      ),
    );
  }
}