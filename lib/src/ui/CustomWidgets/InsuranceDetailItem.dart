import 'package:flutter/material.dart';

class InsuranceDetailRow extends StatelessWidget {
  IconData? icon;
  String label;
  String value;

  InsuranceDetailRow({
    required this.icon, required this.label, required this.value,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Row(
              children: [
                Icon(icon,
                    size: 30, color: Theme.of(context).hintColor),
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
                          fontSize: 16,
                          color: Theme.of(context).accentColor),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}