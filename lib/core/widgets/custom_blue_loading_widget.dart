import 'package:flutter/material.dart';
import '../constants/colors.dart';

class CustomBlueLoadingWidget extends StatelessWidget {
  const CustomBlueLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator(
      color: MyColors.kBlueColor,
    ));
  }
}
