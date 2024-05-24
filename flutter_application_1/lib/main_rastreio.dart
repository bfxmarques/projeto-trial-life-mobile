import 'package:flutter/material.dart';
import 'rastreio.dart';

void main() {
  runApp(RastreioApp());
}

class RastreioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rastreio Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RastreioPage(codigo: '000052'), // Passe um valor de teste para o código
    );
  }
}
