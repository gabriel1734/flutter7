import 'package:flutter/material.dart';
import 'package:flutter_snackbar/lista.dart';

class Corpo extends StatefulWidget {
  const Corpo({Key? key}) : super(key: key);

  @override
  State<Corpo> createState() => _CorpoState();
}

class _CorpoState extends State<Corpo> {
  Lista lista = Lista();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: lista.getItens().length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(lista.getElemento(index)),
            onTap: () {
              // Adiciona um item ao apertar
              setState(() {
                lista.novo(); // Adiciona novo item à lista
              });

              // Mostra o SnackBar com a mensagem e ação de desfazer
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Você adicionou um item: ${index + 1}'),
                  duration: const Duration(seconds: 10),
                  action: SnackBarAction(
                    label: 'Desfazer',
                    onPressed: () {
                      setState(() {
                        lista.deletar(index);
                      });
                    },
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
