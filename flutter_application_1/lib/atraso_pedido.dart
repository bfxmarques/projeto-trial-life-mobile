import 'package:flutter/material.dart';

class AtrasoPedidoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.red),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(''),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Seu pedido está atrasado?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(height: 16),
            buildStepItem('Verifique a data estimada de entrega:', [
              'Confirme a data estimada de entrega que foi fornecida quando você fez o pedido. Às vezes, pode haver uma margem de erro na estimativa de entrega.',
            ]),
            SizedBox(height: 8),
            buildStepItem('Verifique o endereço de entrega:', [
              'Certifique-se de que o endereço de entrega que você forneceu está correto. Às vezes, erros no endereço podem levar a atrasos na entrega ou até mesmo a entrega malsucedida.',
            ]),
          ],
        ),
      ),
    );
  }

  Widget buildStepItem(String title, List<String> steps) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        SizedBox(height: 4),
        for (var step in steps)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: Text(
              step,
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
          ),
      ],
    );
  }
}
