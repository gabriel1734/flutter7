import 'package:flutter/material.dart';
import 'package:flutter_sliverapp/listasliver.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color.fromARGB(255, 4, 64, 27),
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            foregroundColor: Colors.lightGreen,
            backgroundColor: const Color.fromARGB(255, 14, 70, 10),
            leading: const Icon(Icons.menu),
            title: const Text('Barra que some'),
            expandedHeight: 200, // Altura expandida inicial
            collapsedHeight: 60,
            pinned: true,
            floating: true,
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return const FlexibleSpaceBar(
                  titlePadding: EdgeInsets.only(left: 56, bottom: 16),
                );
              },
            ),
          ),
          ListaSliver(),
        ],
      ),
    );
  }
}
