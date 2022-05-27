import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class InvoiceListShimmer extends StatelessWidget {
  const InvoiceListShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding:
      const EdgeInsets.symmetric(vertical: 16, horizontal: 16).r,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: ListView.builder(
                itemBuilder: (_, __) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16).r,
                  child: Container(
                    width: double.infinity,
                    height: 86.h,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(Radius.circular(8)).r
                    ),
                  ),
                ),
                itemCount: 6,
              ),
            ),
          )
        ],
      ),
    );
  }
}
