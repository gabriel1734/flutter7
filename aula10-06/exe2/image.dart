import 'dart:io';

import 'package:flutter/material.dart';

class Imagens extends StatefulWidget {
  const Imagens({super.key});

  @override
  State<Imagens> createState() => _ImagensState();
}

class _ImagensState extends State<Imagens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: mostraImagen());
  }

  Image mostraImagen() {
    if (Platform.isAndroid) {
      return Image.asset('assets/imagens/android.png');
    } else {
      return Image.asset('assets/imagens/windows.png');
    }
  }
}
