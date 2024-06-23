import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_primer_proyecto/table.dart';
import 'package:provider/provider.dart';
import 'footer.dart';
import 'header.dart';

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
    // context.watch<MyAppState>(); // Si necesitas observar cambios en MyAppState

    return Scaffold(
      appBar:
          AppHeader(title: 'Título de Página 1'), // Usar AppHeader como AppBar
      body: Column(
        children: <Widget>[
          Image.asset(
            'assets/images/husares_imagen.jpg', // Ruta de la imagen
            width: 150, // Ancho de la imagen
            height: 300, // Altura de la imagen
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondPage()),
              );
            },
            child: Text('Ir a la Segunda Página'),
          ),
          // Añade más widgets a tu columna según sea necesario
        ],
      ),
      bottomNavigationBar:
          AppFooter(), // Usar AppFooter como BottomNavigationBar
    );
  }
}
