import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../home/data/models/character.dart';
import '../widgets/details_page_body.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.character});
  final Character character;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.kPrimaryColor,
      body: DetailsPageBody(character: character),
    );
  }
}
