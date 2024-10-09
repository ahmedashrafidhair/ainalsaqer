import 'package:ainalsaqer/app/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/components/custom_text.dart';
import '../../../../app/extensions/color.dart';

class FilterChipWidget extends StatelessWidget {
  final String label;
  final bool isActive;
  final Function(bool) onSelected;

  const FilterChipWidget(
      {super.key, required this.label, this.isActive = false, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      showCheckmark: false,
      backgroundColor: Colors.white,
      label: CustomText(
        text: label,
        maxLines: 1,
        fontSize: 12.sp,
        overflow: TextOverflow.ellipsis,
        fontWeight: FontWeight.w600,
        color: isActive ? Colors.white : Colors.black,
      ),
      selected: isActive,
      avatar: null,
      side: BorderSide(
          color: isActive ? HexColor("0D519A") : Colors.black, width: 0.1.w),
      onSelected: onSelected,
      selectedColor: AppColors.primary,
    );
  }
}
