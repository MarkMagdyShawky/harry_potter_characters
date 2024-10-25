import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/colors.dart';

class CustomHouseWidget extends StatelessWidget {
  const CustomHouseWidget({
    super.key,
    required this.house,
  });

  final String house;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 7.h),
      decoration: BoxDecoration(
        color: house.toLowerCase() == 'gryffindor'
            ? MyColors.kRedColor
            : house.toLowerCase() == 'slytherin'
                ? MyColors.kGreenColor
                : house.toLowerCase() == 'hufflepuff'
                    ? MyColors.kYellowColor
                    : house.toLowerCase() == 'ravenclaw'
                        ? MyColors.kSkyBlueColor
                        : MyColors.kPinkColor,
        borderRadius: BorderRadius.circular(60.r),
      ),
      child: Text(
        house.length > 0 ? house : 'unknown',
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: house.toLowerCase() == 'hufflepuff' ? MyColors.kBlackColor : MyColors.kWhiteColor,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
