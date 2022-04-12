import 'package:flutter/material.dart';

class ProfileFieldCard extends StatelessWidget {
  IconData? icon;
  String label;
  String value;
  Function()? editValue;

  ProfileFieldCard({
    required this.icon, required this.label, required this.value, required this.editValue,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric( vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Row(children: [
                Icon(icon, size: 30, color: Theme.of(context).hintColor),
                const SizedBox(
                  width: 30,
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
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      value,
                      style: TextStyle(
                          fontSize: 16, color: Theme.of(context).accentColor),
                    ),
                  ],),
              ],),
            ),
            IconButton(
              onPressed: editValue, icon: const Icon(Icons.edit),
              color: Theme.of(context).primaryColor,
            )
          ],
        ),
      ),
    );
  }
}