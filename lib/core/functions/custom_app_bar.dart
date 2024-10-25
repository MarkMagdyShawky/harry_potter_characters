import 'package:flutter/material.dart';

import '../../features/home/data/models/character.dart';
import '../../features/home/presentation/widgets/search_text_field.dart';
import '../widgets/custom_gradient_text.dart';

AppBar customedAppBar({
  required String title,
  required bool isSearching,
  required List<Color> colorsList,
  required TextEditingController textEditingController,
  required List<Character> allCharacters,
  required List<Widget>? buildAppBarActions,
  required Function(String) onSearch,
}) {
  return AppBar(
    backgroundColor: const Color.fromARGB(0, 0, 0, 0),
    toolbarHeight: 90,
    title: isSearching
        ? SearchTextField(
            textEditingController: textEditingController,
            allCharacters: allCharacters,
            onSearch: onSearch,
          )
        : GradientText(
            colorsList: colorsList,
            title: title,
            fontSize: 30,
          ),
    actions: buildAppBarActions,
  );
}
