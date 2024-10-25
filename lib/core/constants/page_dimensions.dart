import 'package:flutter/material.dart';

class PageDimensions {
  pageWidth(BuildContext context) {
    return MediaQuery.sizeOf(context).width;
  }

  pageHeight(BuildContext context) {
    return MediaQuery.sizeOf(context).height;
  }
}
