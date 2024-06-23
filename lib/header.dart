import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppHeader({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              // Código para manejar el clic en el botón de inicio
            },
          ),
          Flexible(
            // Hace que el título sea flexible
            child: FittedBox(
              // Asegura que el texto se ajuste al espacio disponible
              fit: BoxFit
                  .scaleDown, // Escala el texto hacia abajo para que encaje
              child: Text(title,
                  style: TextStyle(
                      color: Color.fromARGB(255, 151, 238,
                          12))), // Utiliza la variable title aquí
            ),
          ), // Utiliza la variable title aquí
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    // Acción para Opción 1
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Color.fromARGB(255, 245, 36, 36),
                    backgroundColor: Colors.white, // Color del texto
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20), // Bordes redondeados
                      side: BorderSide(
                          color: Color.fromARGB(
                              255, 245, 36, 36)), // Borde del botón
                    ),
                  ),
                  child: Text('Opción 1'),
                ),
                SizedBox(width: 8), // Espacio entre botones
                TextButton(
                  onPressed: () {
                    // Acción para Opción 2
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Color.fromARGB(255, 238, 44, 44),
                    backgroundColor:
                        Color.fromARGB(255, 255, 255, 255), // Color del texto
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20), // Bordes redondeados
                      side: BorderSide(
                          color: Color.fromARGB(
                              255, 238, 44, 44)), // Borde del botón
                    ),
                  ),
                  child: Text('Opción 2'),
                ),
                // Añade más botones según necesites
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // Código para manejar más acciones
            },
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
