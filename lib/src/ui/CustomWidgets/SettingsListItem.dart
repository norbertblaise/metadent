import 'package:flutter/material.dart';

class SettingsListItem extends StatelessWidget {
  final String label;
  final Function()? onTap;
  final IconData? icon;

  const SettingsListItem({
    required this.label,
    required this.onTap,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7.5),
        child: Row(
          children: [
            Icon(
              icon,
              color: Theme.of(context).accentColor,
              size: 30,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              label,
              style: TextStyle(
                color: Theme.of(context).accentColor,
                fontWeight: FontWeight.bold,
                fontFamily: 'Source Sans Pro',
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}
