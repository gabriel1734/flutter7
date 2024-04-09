import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class imgFromJson {
  final String url;
  final String thumbnailUrl;

  const imgFromJson({
    required this.url,
    required this.thumbnailUrl,
  });

  factory imgFromJson.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'url': String url,
        'thumbnailUrl': String thumbnailUrl,
      } =>
        imgFromJson(url: url, thumbnailUrl: thumbnailUrl),
      _ => throw const FormatException('Falha ao carregar Poste.'),
    };
  }
}

class NovaTelaImg extends StatefulWidget {
  const NovaTelaImg({super.key});

  @override
  State<NovaTelaImg> createState() => _NovaTelaImgState();
}

class _NovaTelaImgState extends State<NovaTelaImg> {
  int count = 1;
  late Future<imgFromJson> imgSrc;

  Future<imgFromJson> getImg(int n) async {
    final resposta = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos/$n'));

    if (resposta.statusCode == 200) {
      // 200 é OK
      final img = imgFromJson
          .fromJson(jsonDecode(resposta.body) as Map<String, dynamic>);

      return img;
    } else {
      throw Exception('Falha ao carregar poste.');
    }
  }

  void novaImg() {
    setState(() {
      count++;
      imgSrc = getImg(count);
    });
  }

  @override
  @override
  void initState() {
    super.initState();
    imgSrc = getImg(count);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Imagem')),
        body: Column(
          children: [
            FutureBuilder<imgFromJson>(
              future: imgSrc,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Image.network(snapshot.data!.thumbnailUrl.toString());
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                  onPressed: novaImg, child: const Text('Novo IMG\  ')),
            ),
          ],
        ));
  }
}
