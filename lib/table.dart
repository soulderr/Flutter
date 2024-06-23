import 'package:flutter/material.dart';
import 'header.dart';
import 'footer.dart';
import 'table-def.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final _formKey = GlobalKey<FormState>(); // Clave global para el formulario
  final TextEditingController _nombreEquipoController = TextEditingController();
  final TextEditingController _numeroJugadoresController =
      TextEditingController();

  @override
  void dispose() {
    // Limpia los controladores cuando el Widget se desmonte
    _nombreEquipoController.dispose();
    _numeroJugadoresController.dispose();
    super.dispose();
  }

  Widget name(
      {required TextEditingController controller,
      required InputDecoration decoration}) {
    return TextField(
      controller: controller,
      decoration: decoration,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppHeader(title: 'Creación de Equipo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _nombreEquipoController,
                decoration: InputDecoration(labelText: 'Nombre del Equipo'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa el nombre del equipo';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _numeroJugadoresController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Número de Jugadores'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa el número de jugadores';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Si el formulario es válido, navega a la tercera página
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TablaJugadores(
                            nombreEquipo: _nombreEquipoController.text,
                            numJugadores:
                                int.parse(_numeroJugadoresController.text)),
                      ),
                    );
                  }
                },
                child: Text('Enviar'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AppFooter(),
    );
  }
}
