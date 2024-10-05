import 'package:ainalsaqer/app/components/custom_text.dart';
import 'package:ainalsaqer/app/extensions/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileDetail extends StatelessWidget {
  final String title;
  final String value;
  final bool? isLast;

  const ProfileDetail({
    super.key,
    required this.title,
    required this.value,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0),
      child: SizedBox(
        width: ScreenUtil().screenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
                text: title,
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black,
                height: 0),
            9.verticalSpace,
            CustomText(
                text: value,
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: Colors.black,
                height: 0),
            Visibility(
                visible: isLast == false,
                child: Column(
                  children: [
                    12.verticalSpace,
                    Divider(
                        thickness: 0.30.h,
                        height: 0,
                        color: HexColor("BBBBBB")),
                    12.verticalSpace,
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
