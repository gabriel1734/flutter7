import 'package:flutter/material.dart';
import 'package:flutter_textos/resultado.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  TextEditingController controlador = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      drawer: const Drawer(
          child: Text(
              'Settings icon by Ravindra Kalkani ([https://iconscout.com/contributors/ravindra-kalkani])')),
      body: Column(
        children: [
          TextField(
            controller: controlador,
            onChanged: (String texto) {
              setState(() {});
            },
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Resultado(controlador.text),
                  ),
                );
              },
              child: Text('Verificar')),
        ],
      ),
    );
  }
}
