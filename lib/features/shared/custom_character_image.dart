import 'package:flutter/material.dart';

import '../../core/constants/my_images.dart';
import '../home/data/models/character.dart';

class CustomCharacterImage extends StatelessWidget {
  const CustomCharacterImage({
    super.key,
    required this.character,
    required this.borderRadius,
  });

  final Character character;
  final BorderRadiusGeometry borderRadius;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: character.image.isNotEmpty
          ? FadeInImage.assetNetwork(
              placeholder: MyImages.kLoadingImage,
              image: character.image,
              fit: BoxFit.cover,
            )
          : Image.asset(
              MyImages.kNotLoaded,
              fit: BoxFit.cover,
            ),
    );
  }
}
