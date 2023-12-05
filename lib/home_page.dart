import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:latex_in_flutter/latex_style.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final String errorMessage = 'Latex file has no data';

  Future<String?> _loadLatex1() async {
    return await rootBundle.loadString('assets/latex/latex1.tex');
  }

  Future<String?> _loadLatex2() async {
    return await rootBundle.loadString('assets/latex/latex2.tex');
  }

  Future<String?> _loadLatex3() async {
    return await rootBundle.loadString('assets/latex/latex3.tex');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Latex in Flutter"),
      ),
      body: body(),
    );
  }

  Widget body() {
    return FutureBuilder(
        future: Future.wait([
          _loadLatex1(),
          _loadLatex2(),
          _loadLatex3(),
        ]),
        builder: (context, snapshot) {
          String latex1 = snapshot.data?[0] ?? errorMessage;
          String latex2 = snapshot.data?[1] ?? errorMessage;
          String latex3 = snapshot.data?[2] ?? errorMessage;

          return TeXView(
            child: TeXViewColumn(
              children: [
                latexFile(latex1),
                latexFile(latex2),
                latexFile(latex3),
              ],
            ),
          );
        });
  }

  TeXViewDocument latexFile(String latexFileContent) {
    return TeXViewDocument(
      r''' ''' +
          latexFileContent +
          r'''
       ''',
      style: LatexStyle.style(),
    );
  }
}
