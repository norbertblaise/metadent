import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InvoiceCard extends StatelessWidget {
  final String title;
  final String status;
  final String amountDue;
  final String date;
  final Function()? onTap;

  const InvoiceCard({
    Key? key,
    required this.title,
    required this.status,
    required this.amountDue,
    required this.date,
    required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 8.r,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0).r,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0).r,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style:
                          Theme.of(context).textTheme.headlineSmall),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        status,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        date,
                        style: Theme.of(context).textTheme.bodyText2,
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("\$ $amountDue",
                          style:
                          Theme.of(context).textTheme.headlineSmall),
                      SizedBox(
                        height: 45.h,
                      ),
                      // Icon(Icons.chevron_right,size: 25.0.sp,)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}