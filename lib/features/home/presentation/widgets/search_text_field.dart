import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/colors.dart';
import '../../data/models/character.dart';

class SearchTextField extends StatefulWidget {
  SearchTextField({
    super.key,
    required this.textEditingController,
    required this.allCharacters,
    required this.onSearch,
  });

  final TextEditingController textEditingController;
  final List<Character> allCharacters;
  final Function(String) onSearch;
  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  late List<Character> searchesCharacters;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.textEditingController,
      decoration: InputDecoration(
        hintText: 'Search for character',
        hintStyle: const TextStyle(
          color: MyColors.kWhiteColor,
          fontSize: 14,
        ),
        enabledBorder: _outlineInputBorder(),
        border: _outlineInputBorder(),
      ),
      style: TextStyle(
        color: MyColors.kWhiteColor,
        fontSize: 16.sp,
      ),
      onChanged: widget.onSearch,
    );
  }

  OutlineInputBorder _outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(60.r),
      borderSide: const BorderSide(color: MyColors.kWhiteColor),
    );
  }
}
