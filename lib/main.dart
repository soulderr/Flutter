import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
      body: Column(
        children: [
          Text('A random idea:'),
          Text(appState.current.asLowerCase),
          Image.asset(
            'assets/images/husares_imagen.jpg', // Ruta de la imagen
            width: 150, // Ancho de la imagen
            height: 300, // Altura de la imagen
          ),
          Table(
            border: TableBorder
                .all(), // Permite agregar una decoración de borde alrededor de tu tabla
            children: [
              TableRow(children: [
                Text('NOMBRE', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('JUEGOS', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('GOLES', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('ASISTENCIAS',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text('DEFENSAS', style: TextStyle(fontWeight: FontWeight.bold)),
              ]),
              TableRow(children: [
                Text('Cristian'),
                Text('2'),
                Text('Dato 3'),
                Text('Dato 3'),
                Text('Columna 3'),
              ]),
              // Puedes agregar más TableRow según lo necesites
            ],
          ),
        ],
      ),
    );
  }
}
