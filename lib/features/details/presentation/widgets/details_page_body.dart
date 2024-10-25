// Page for display the details of each character from the api response image and name and house and ancestry of the character

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:harry_potter/core/constants/colors.dart';
import 'package:harry_potter/features/details/presentation/widgets/custom_house_widget.dart';
import 'package:harry_potter/features/home/data/models/character.dart';

class DetailsPageBody extends StatelessWidget {
  const DetailsPageBody({super.key, required this.character});
  final Character character;
  @override
  Widget build(BuildContext context) {
    Widget _characterInfo(String name, String value) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '$name: ',
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: value != null && value.length > 0 ? value : 'Unknowen',
                  style: const TextStyle(
                    fontSize: 17,
                    overflow: TextOverflow.clip,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }

    Widget _divider(double endIndent) {
      return Divider(
        color: MyColors.kSkyBlueColor,
        thickness: 2,
        height: 30.h,
        endIndent: endIndent,
      );
    }

    return CustomScrollView(
      slivers: [
        CustomSliverAppBar(character: character),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 40.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 150.w,
                      child: CustomHouseWidget(house: character.house),
                    ),
                    SizedBox(height: 50.h),
                    _characterInfo('Name', character.name),
                    _divider(210),
                    SizedBox(height: 20.h),
                    _characterInfo('House', character.house),
                    _divider(320),
                    SizedBox(height: 20.h),
                    _characterInfo('Gender', character.gender),
                    _divider(250),
                    SizedBox(height: 20.h),
                    _characterInfo('Ancestry', character.halfBloodORBureOrMuggle),
                    _divider(300),
                    SizedBox(height: 400.h),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 500.h, //! The height of the app bar when it is expanded
      stretch: true, //! The app bar will stretch when the user scrolls up
      pinned: true, //! The app bar will be pinned to the top of the screen

      flexibleSpace: FlexibleSpaceBar(
        title: Text(character.name),
        background: Hero(
          tag: character.id,
          child: networkImage(),
        ),
      ),
    );
  }

  Image networkImage() {
    return Image.network(
      character.image,
      fit: BoxFit.fill,
    );
  }
}
