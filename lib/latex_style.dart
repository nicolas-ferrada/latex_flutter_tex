import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';

class LatexStyle {
  static TeXViewStyle style() {
    return const TeXViewStyle(
      margin: TeXViewMargin.all(10),
      textAlign: TeXViewTextAlign.center,
      backgroundColor: Colors.grey,
      border: TeXViewBorder.all(
        TeXViewBorderDecoration(
          borderColor: Colors.black,
          borderWidth: 1,
        ),
      ),
    );
  }
}
