import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:latex_in_flutter/latex_style.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<String> _loadTexFile() async {
    return await rootBundle.loadString('assets/latex-file.tex');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TeXViewDocument"),
      ),
      body: loadLatex(),
    );
  }

  FutureBuilder<String> loadLatex() {
    return FutureBuilder(
      future: _loadTexFile(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return TeXView(
            child: TeXViewColumn(
              style: const TeXViewStyle(textAlign: TeXViewTextAlign.center),
              children: [
                inWidgetLatexDocument(),
                fromAssetsLatexDocument(snapshot.data ?? ''),
              ],
            ),
            style: LatexStyle.style(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error loading TeX file: ${snapshot.error}'),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return const Center(
            child: Text('Unexpected error loading TeX file.'),
          );
        }
      },
    );
  }

  TeXViewDocument inWidgetLatexDocument() {
    return const TeXViewDocument(
      r'''$$
      \begin{bmatrix}
       a & b
       \\
       c & d
       \end{bmatrix}
       $$''',
    );
  }

  TeXViewDocument fromAssetsLatexDocument(String latexFileContent) {
    return TeXViewDocument(
      r''' ''' +
          latexFileContent +
          r'''
       ''',
    );
  }
}
