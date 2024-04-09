import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Poste.dart';
import 'package:http/http.dart' as http;

class NovaTela extends StatefulWidget {
  const NovaTela({super.key});

  @override
  State<NovaTela> createState() => _NovaTelaState();
}

class _NovaTelaState extends State<NovaTela> {
  late Future<Poste> futuroPoste;
  int cont = 1;
  List<Poste> posts = [];

  Future<Poste> buscaPOSTE(int n) async {
    final resposta = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/$n'));

    if (resposta.statusCode == 200) {
      // 200 é OK
      final post =
          Poste.fromJson(jsonDecode(resposta.body) as Map<String, dynamic>);
      setState(() {
        posts.add(post);
      });
      return post;
    } else {
      throw Exception('Falha ao carregar poste.');
    }
  }

  void novoPoste() {
    setState(() {
      cont++;
      futuroPoste = buscaPOSTE(cont);
    });
  }

  @override
  void initState() {
    super.initState();
    futuroPoste = buscaPOSTE(cont);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mostrando Posts'),
      ),
      body: Column(
        children: [
          Center(
            child: FutureBuilder<Poste>(
              future: futuroPoste,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data!.titulo);
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
                onPressed: novoPoste, child: const Text('Novo Poste')),
          ),
          ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(posts[index].titulo),
              );
            },
          ),
        ],
      ),
    );
  }
}
