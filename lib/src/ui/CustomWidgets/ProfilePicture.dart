import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: [
        Container(
          height: 140.h,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 24.0).r,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 52.r,
                  child: CircleAvatar(
                    radius: 45.r,
                    //todo change to profile pic otherwise use placeholder
                    backgroundImage: const AssetImage(
                        'assets/images/default-profile-pic.png'),
                  ),
                ),
                Positioned(
                  top: 82.r,
                  left: 210.r,
                  child: Container(
                    width: 32.w,
                    height: 32.w,
                    child: Padding(
                      padding: EdgeInsets.all(0),
                      child: IconButton(
                        onPressed: () {
                          //todo select new profile picture
                        },
                        icon: Icon(
                          Icons.camera_alt_rounded,
                          color: Theme.of(context).primaryColor,
                          size: 18.r,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(50.r),
                        )),
                  ),
                ),
              ],
            ),
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).primaryColor,
                Color(0xFFFFA776)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
