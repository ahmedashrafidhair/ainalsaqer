import 'package:ainalsaqer/app/components/custom_text.dart';
import 'package:ainalsaqer/app/extensions/color.dart';
import 'package:ainalsaqer/app/util/utils.dart';
import 'package:ainalsaqer/data/models/settings_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemSettings extends StatelessWidget {
  final SettingsModel item;

  const ItemSettings({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: SvgPicture.asset(Utils.getIconPath(item.icon),
              width: 24.w, height: 24.h),
          title: CustomText(
              text: item.title,
              color: item.textColor ?? Colors.black,
              fontWeight: FontWeight.w600,
              height: 0,
              fontSize: 15.sp),
          trailing: item.isLast == false
              ? Icon(Icons.arrow_forward_ios, size: 16.r)
              : null,
          onTap: item.onTap,
        ),
        Visibility(
            visible: item.isLast == false,
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                  start: 16.w, end: 16.w, bottom: 4.h, top: 4.h),
              child: Divider(
                  thickness: 0.5.h,
                  height: 0,
                  color: HexColor("D6D6D6") // Change color as needed
                  ),
            )),
      ],
    );
  }
}
