import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/utils/app_router.dart';
import '../../data/models/character.dart';
import '../../../shared/custom_character_image.dart';

class CustomCharacterItem extends StatelessWidget {
  const CustomCharacterItem({super.key, required this.character});
  final Character character;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(RoutsNames.details, extra: character);
      },
      child: Hero(
        tag: character.id,
        child: Container(
          margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
          width: double.infinity,
          decoration: _mainContainerBoxDecoration(),
          child: GridTile(
            footer: Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              decoration: _textContainerBoxDecoration(),
              child: Text(
                character.name,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.clip,
                maxLines: 2,
              ),
            ),
            child: CustomCharacterImage(character: character, borderRadius: BorderRadius.circular(40.r)),
          ),
        ),
      ),
    );
  }

  BoxDecoration _textContainerBoxDecoration() {
    return BoxDecoration(
      color: Colors.black.withOpacity(0.8),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(40.r),
        bottomRight: Radius.circular(40.r),
      ),
    );
  }

  BoxDecoration _mainContainerBoxDecoration() {
    return BoxDecoration(
      color: MyColors.kPrimaryColor,
      borderRadius: BorderRadius.circular(40.r),
      boxShadow: const [
        BoxShadow(
          color: MyColors.kPrimaryColor,
          spreadRadius: 1,
          blurRadius: 2,
          offset: Offset(0, 2),
        ),
      ],
    );
  }
}
