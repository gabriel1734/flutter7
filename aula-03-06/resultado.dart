import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Resultado extends StatelessWidget {
  String _textoRecebido;
  Resultado(this._textoRecebido, {super.key});

  @override
  Widget build(BuildContext context) {
    Text criaTexto(String txt, TextStyle estilo) {
      return Text(
        txt,
        style: estilo,
      );
    }

    Container criaContainer(String txt, double padding, TextStyle font) {
      return Container(
        padding: EdgeInsets.all(padding),
        child: criaTexto(txt, font),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(children: [
          criaContainer("Digitado!", 20.0, GoogleFonts.sevillana()),
          criaContainer("Digitado!", 20.0, GoogleFonts.roboto()),
          criaContainer("Digitado!", 20.0, GoogleFonts.sourceCodePro()),
          ElevatedButton(
              onPressed: () {},
              child: Image.asset('assets/imagens/pencil.png')),
        ]),
      ),
    );
  }
}
