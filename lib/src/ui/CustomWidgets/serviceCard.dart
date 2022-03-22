import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  final String imagePath;
  final String cardLabel;
  final void Function()? destination;

  const ServiceCard(
      {Key? key,
      required this.imagePath,
      required this.cardLabel,
      required this.destination})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).backgroundColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(10.0),
        onTap: //go to relevant page
          destination ,
        child: Container(
          height: 200,
          width: 180,
          child: Card(
            elevation: 9.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 22.0, right: 22.0, top: 16, bottom: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 90,
                    width:  110,
                    child: Image(
                      image: AssetImage(imagePath),
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(
                    height: 14.0,
                  ),
                  Text(
                    cardLabel,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelSmall,
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
