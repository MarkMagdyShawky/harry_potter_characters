// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harry_potter/core/constants/colors.dart';
import 'package:harry_potter/features/home/data/models/character.dart';
import 'package:harry_potter/features/home/presentation/cubit/characters_cubit.dart';
import 'package:harry_potter/features/home/presentation/widgets/custom_character_item.dart';

class CustomSingleChildScrollView extends StatelessWidget {
  const CustomSingleChildScrollView({
    super.key,
    required this.allCharacter,
    required this.searchedCharacter,
    required this.textEditingController,
  });
  final List<Character> allCharacter;
  final List<Character> searchedCharacter;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<CharactersCubit, CharactersState>(
        builder: (context, state) {
          if (state is CharactersLoaded) {
            return GridView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 4 / 5,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
              ),
              padding: EdgeInsets.zero,
              itemCount: textEditingController.text.isEmpty ? allCharacter.length : searchedCharacter.length,
              itemBuilder: (context, index) {
                return CustomCharacterItem(
                  character:
                      textEditingController.text.isEmpty ? allCharacter[index] : searchedCharacter[index],
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: MyColors.kBlueColor,
              ),
            );
          }
        },
      ),
    );
  }
}
