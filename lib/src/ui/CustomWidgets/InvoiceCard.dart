import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InvoiceCard extends StatelessWidget {
  const InvoiceCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
                      Text("Treatment One",
                          style:
                          Theme.of(context).textTheme.headlineSmall),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        "INV-123309480605986",
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        "2022-04-25",
                        style: Theme.of(context).textTheme.bodyText2,
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("\$ 80",
                          style:
                          Theme.of(context).textTheme.headlineSmall),
                      SizedBox(
                        height: 24.h,
                      ),
                      Icon(Icons.chevron_right,size: 25.0.sp,)
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