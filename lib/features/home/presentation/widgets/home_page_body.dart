import 'dart:ui';

import 'package:flutter/material.dart';
import '../../../../core/constants/my_images.dart';
import '../../../../core/constants/page_dimensions.dart';
import '../../data/models/character.dart';
import 'custom_single_child_scroll_view.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({
    super.key,
    required this.searchesCharacters,
    required this.allCharacters,
    required this.textEditingController,
    required this.onSearch,
  });
  final Function(String) onSearch;
  final List<Character> searchesCharacters;
  final List<Character> allCharacters;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: PageDimensions().pageWidth(context),
      height: PageDimensions().pageHeight(context),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(MyImages.kBluredImage),
          fit: BoxFit.fill,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 100, sigmaY: 60),
        child: CustomSingleChildScrollView(
          allCharacter: allCharacters,
          searchedCharacter: searchesCharacters,
          textEditingController: textEditingController,
        ),
      ),
    );
  }
}
