import 'package:flutter/material.dart';

class AppFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: MediaQuery.of(context).size.width,
      height: 50.0,
      child: Center(
        child: Text(
          'Cristian Eduardo Montes Sanchez',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
