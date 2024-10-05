import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/components/custom_text.dart';
import '../../../../app/extensions/color.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String email;
  final String profileImage;

  const ProfileHeader({
    super.key,
    required this.name,
    required this.email,
    required this.profileImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child:Row(
        children: [
          CircleAvatar(
            radius: 30.r,
            backgroundImage:
            AssetImage(profileImage), // Use NetworkImage for online images
          ),
          16.horizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: name,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                height: 0,
                color: HexColor("31507F"),
              ),
              CustomText(
                text: email,
                fontSize: 14.sp,
                fontWeight: FontWeight.w300,
                color: HexColor("31507F"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
