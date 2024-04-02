import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Poste.dart';
import 'package:http/http.dart' as http;

Future<Poste> buscaPOSTE(int n) async {
  final resposta = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/${n}'));

  if (resposta.statusCode == 200) {
    // 200 é OK
    return Poste.fromJson(jsonDecode(resposta.body) as Map<String, dynamic>);
  } else {
    throw Exception('Falha ao carregar poste.');
  }
}

class NovaTela extends StatefulWidget {
  const NovaTela({super.key});

  @override
  State<NovaTela> createState() => _NovaTelaState();
}

class _NovaTelaState extends State<NovaTela> {
  late Future<Poste> futuroPoste;
  List<String> listView = [];
  int n = 1;

  void novoPost() {}

  @override
  void initState() {
    super.initState();
    futuroPoste = buscaPOSTE(n);
    listView.add(futuroPoste.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mostrando Post!!!")),
      body: Column(
        children: [
          ListView.builder(itemBuilder: (context, index) {
            return Text(listView[index]);
          })
        ],
      ),
    );
  }
}
