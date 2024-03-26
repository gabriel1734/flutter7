import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _y = 0;
  final TextEditingController _controlaSoma = TextEditingController();
  final TextEditingController _controlaOp = TextEditingController();
  Icon certo = const Icon(Icons.check);
  Icon errado = const Icon(Icons.close);
  Icon saida = const Icon(Icons.question_mark);
  List _x = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  int _z = 1;
  Map _resposta = {};

  void trocarOperador() {
    setState(() {
      _x = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
      _z = int.parse(_controlaOp.text);
      _resposta.clear();
      _y = _x[Random().nextInt(_x.length)];
    });
  }

  void corrigir() {
    int soma = _z + _y;
    String digitado = _controlaSoma.text;
    int resultado = int.parse(digitado);

    setState(() {
      if (soma == resultado) {
        saida = certo;
        _x.remove(_y);
        _resposta.addAll({'$_z+$_y': certo});
      } else {
        saida = errado;
        _resposta.addAll({'$_z+$_y': errado});
      }
      _controlaSoma.text = '';
      if (_x.isEmpty) {
        _y = 0;
      } else {
        _y = _x[Random().nextInt(_x.length)];
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _y = Random().nextInt(10);
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
    _y = Random().nextInt(10);
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                Text('$_z + $_y = '),
                SizedBox(
                  width: 50,
                  child: TextField(
                    controller: _controlaSoma,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: corrigir,
              child: const Text('Corrigir'),
            ),
            SizedBox(
              height: 32,
              width: 32,
              child: saida,
            ),
            Table(
              border: TableBorder.all(),
              children: [
                TableRow(children: [
                  TableCell(
                    child: SizedBox(
                      width: 32,
                      height: 32,
                      child: _resposta['$_z+0'],
                    ),
                  ),
                  TableCell(
                    child: SizedBox(
                      width: 32,
                      height: 32,
                      child: _resposta['$_z+1'],
                    ),
                  ),
                  TableCell(
                    child: SizedBox(
                      width: 32,
                      height: 32,
                      child: _resposta['$_z+2'],
                    ),
                  ),
                  TableCell(
                    child: SizedBox(
                      width: 32,
                      height: 32,
                      child: _resposta['$_z+3'],
                    ),
                  ),
                  TableCell(
                    child: SizedBox(
                      width: 32,
                      height: 32,
                      child: _resposta['$_z+4'],
                    ),
                  ),
                  TableCell(
                    child: SizedBox(
                      width: 32,
                      height: 32,
                      child: _resposta['$_z+5'],
                    ),
                  ),
                  TableCell(
                    child: SizedBox(
                      width: 32,
                      height: 32,
                      child: _resposta['$_z+6'],
                    ),
                  ),
                  TableCell(
                    child: SizedBox(
                      width: 32,
                      height: 32,
                      child: _resposta['$_z+7'],
                    ),
                  ),
                  TableCell(
                    child: SizedBox(
                      width: 32,
                      height: 32,
                      child: _resposta['$_z+8'],
                    ),
                  ),
                  TableCell(
                    child: SizedBox(
                      width: 32,
                      height: 32,
                      child: _resposta['$_z+9'],
                    ),
                  ),
                  TableCell(
                    child: SizedBox(
                      width: 32,
                      height: 32,
                      child: _resposta['$_z+10'],
                    ),
                  ),
                ])
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Digite um novo operador caso deseje trocar: '),
                SizedBox(
                  width: 50,
                  child: TextField(
                    controller: _controlaOp,
                  ),
                ),
                ElevatedButton(
                  onPressed: trocarOperador,
                  child: const Text('Enviar'),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
