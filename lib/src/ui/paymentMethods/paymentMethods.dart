import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metadent/routes.dart' as routes;

import '../../../app.dart';

class PaymentMethods extends StatefulWidget {
  const PaymentMethods({Key? key}) : super(key: key);

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          localizedString!.paymentMethods,
          style: const TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, routes.addPaymentMethod);
            },
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          buildPaymentCard(context, "4094561355667"),
          buildPaymentCard(context, "3094561355667"),
          buildPaymentCard(context, "5094561355667"),
        ],
      ),
    );
  }

  Padding buildPaymentCard(BuildContext context, String cardNumber) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 16).r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              SizedBox(
                height: 40.h,
                width: 40.w,
                child: Image.asset(getCardLogo(cardNumber)),
              ),
              SizedBox(
                width: 12.w,
              ),
              Text(
                getCardName(cardNumber),
                style: Theme.of(context).textTheme.labelMedium,
              )
            ],
          ),
          Row(
            children: [
              Text(
                "***0834",
                style: Theme.of(context).textTheme.labelMedium,
              ),
              IconButton(
                  onPressed: /* todo goto card detail*/ () {
                    Navigator.pushNamed(context, routes.paymentMethodDetails);
                  },
                  icon: Icon(
                    Icons.chevron_right,
                    color: Theme.of(context).accentColor,
                    size: 30.r,
                  ))
            ],
          )
        ],
      ),
    );
  }

  getCardLogo(String cardNumber) {
    switch (cardNumber[0]) {
      case '3':
        return 'assets/images/amex-50.png';
      case '4':
        return 'assets/images/visa-60.png';
      case '5':
        return 'assets/images/mastercard-50.png';
      case '6':
        return 'assets/images/discover-50.png';
      default:
        return 'assets/images/credit-card.png';
    }
  }

  getCardName(String cardNumber) {
    switch (cardNumber[0]) {
      case '3':
        return 'Amex';
      case '4':
        return 'Visa';
      case '5':
        return 'MasterCard';
      case '6':
        return 'Discover';
      default:
        return 'assets/images/credit-card.png';
    }
  }
}
