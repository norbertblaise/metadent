import 'package:flutter/material.dart';

import 'gradientAppBar.dart';
class CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  CustomSliverAppBarDelegate({
    required this.expandedHeight,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    const size = 60;
    final top = expandedHeight / 4 - shrinkOffset / 2;

    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [
        buildBackground(shrinkOffset, context),
        buildAppBar(shrinkOffset),
        buildProfilePic(top, shrinkOffset, context),
      ],
    );
  }

  Widget buildProfilePic(double top, double shrinkOffset, BuildContext context) {
    return Opacity(
      opacity: disappear(shrinkOffset),
      child: Positioned(
        top: top,
        left: 0.0,
        right: 0.0,
        child: Stack(
          alignment: Alignment.center,

          children: [
            const CircleAvatar(
              backgroundColor: Colors.white,
              radius: 54,
              child: CircleAvatar(
                radius: 47,
                //todo change to profile pic otherwise use placeholder
                backgroundImage:
                AssetImage('assets/images/default-profile-pic.png'),
              ),
            ),
            Positioned(
              top: 108,
              left: 220,

              child: Container(
                width: 33,
                height: 33,
                child: Padding(
                  padding: EdgeInsets.all(0),
                  child: IconButton(
                    onPressed: () {
                      //todo select new profile picture
                    },
                    icon: Icon(
                      Icons.camera_alt_rounded,
                      color: Theme.of(context).primaryColor,
                      size: 18,
                    ),
                  ),
                ),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    )
                ),
              ),

            ),
          ],
        ),
      ),
    );
  }

  double appear(double shrinkOffset) => shrinkOffset / expandedHeight;

  double disappear(double shrinkOffset) => 1 - shrinkOffset / expandedHeight;

  Widget buildAppBar(double shrinkOffset) => Opacity(
    opacity: appear(shrinkOffset),
    child: AppBar(
      title: Text("Personal Info"),
      elevation: 0,
    ),
  );

  Widget buildBackground(double shrinkOffset, BuildContext context) => Opacity(
    opacity: disappear(shrinkOffset),
    child: Stack(
      children: [
        const GradientAppBar(),
        Padding(
          padding:
          EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
      ],
    ),
  );

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight + 30;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
