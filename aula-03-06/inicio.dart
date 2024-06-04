import 'package:flutter/material.dart';

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
        title: const Text('Início'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          TextField(
            controller: controlador,
            onChanged: (String txt) {
              setState(() {});
            },
          ),
          Text(controlador.text),
          ElevatedButton(onPressed: () {}, child: Text("Verificar"))
        ],
      ),
    );
  }
}
