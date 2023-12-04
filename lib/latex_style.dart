import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';

class LatexStyle {
  static TeXViewStyle style() {
    return const TeXViewStyle(
      margin: TeXViewMargin.all(4),
      borderRadius: TeXViewBorderRadius.all(15),
      width: 250,
      textAlign: TeXViewTextAlign.center,
      backgroundColor: Colors.greenAccent,
      border: TeXViewBorder.all(
        TeXViewBorderDecoration(
          borderColor: Colors.grey,
          borderWidth: 5,
        ),
      ),
    );
  }
}
