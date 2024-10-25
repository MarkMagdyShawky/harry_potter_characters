import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  const GradientText({
    super.key,
    required this.colorsList,
    required this.title,
    required this.fontSize,
  });

  final List<Color> colorsList;
  final String title;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: colorsList, // Define your gradient colors
        begin: Alignment.topLeft, // Gradient start
        end: Alignment.bottomRight, // Gradient end
      ).createShader(Rect.fromLTWH(0.0, 0.0, bounds.width, bounds.height)),
      child: Text(
        title,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: Colors.white, // This color will be overridden by the gradient
        ),
      ),
    );
  }
}
