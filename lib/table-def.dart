import 'package:flutter/material.dart';
import 'header.dart';
import 'footer.dart';

class TablaJugadores extends StatefulWidget {
  final String nombreEquipo;
  final int numJugadores;

  const TablaJugadores(
      {Key? key, required this.nombreEquipo, required this.numJugadores})
      : super(key: key);

  @override
  _TablaJugadoresState createState() => _TablaJugadoresState();
}

class _TablaJugadoresState extends State<TablaJugadores> {
  late List<Map<String, dynamic>> jugadores;

  @override
  void initState() {
    super.initState();
    jugadores = List.generate(
      widget.numJugadores,
      (index) => {
        'Nombre': 'Jugador ${index + 1}',
        'Número de juegos': 0,
        'Goles': 0,
        'Asistencias': 0,
        'Defensas': 0,
      },
    );
  }

  List<DataRow> _crearFilasDeJugadores() {
    return jugadores.map((jugador) {
      return DataRow(cells: [
        DataCell(TextFormField(
          initialValue: jugador['Nombre'],
          onSaved: (value) {
            jugador['Nombre'] = value!;
          },
        )),
        DataCell(TextFormField(
          initialValue: jugador['Número de juegos'].toString(),
          keyboardType: TextInputType.number,
          onSaved: (value) {
            jugador['Número de juegos'] = int.parse(value!);
          },
        )),
        DataCell(TextFormField(
          initialValue: jugador['Goles'].toString(),
          keyboardType: TextInputType.number,
          onSaved: (value) {
            jugador['Goles'] = int.parse(value!);
          },
        )),
        DataCell(TextFormField(
          initialValue: jugador['Asistencias'].toString(),
          keyboardType: TextInputType.number,
          onSaved: (value) {
            jugador['Asistencias'] = int.parse(value!);
          },
        )),
        DataCell(TextFormField(
          initialValue: jugador['Defensas'].toString(),
          keyboardType: TextInputType.number,
          onSaved: (value) {
            jugador['Defensas'] = int.parse(value!);
          },
        )),
      ]);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppHeader(title: widget.nombreEquipo), // Usa tu AppHeader aquí
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: const [
            DataColumn(label: Text('Nombre')),
            DataColumn(label: Text('Número de juegos')),
            DataColumn(label: Text('Goles')),
            DataColumn(label: Text('Asistencias')),
            DataColumn(label: Text('Defensas')),
            // Añade más columnas según necesites
          ],
          rows: _crearFilasDeJugadores(),
        ),
      ),
      bottomNavigationBar: AppFooter(),
    );
  }
}

void main() => runApp(MaterialApp(
    home: TablaJugadores(nombreEquipo: 'Los Campeones', numJugadores: 5)));
