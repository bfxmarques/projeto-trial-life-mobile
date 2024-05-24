import 'package:flutter/material.dart';

class CodigoErroPage extends StatelessWidget {
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
        title: Text('Meu código de rastreio não funciona'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Seu código de rastreio não funciona?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(height: 16),
            buildErroItem(
              context,
              '1. Verifique a entrada do código de rastreamento:',
              'Certifique-se de que você inseriu corretamente o código de rastreamento. Às vezes, erros de digitação simples podem levar a problemas.',
            ),
            SizedBox(height: 8),
            buildErroItem(
              context,
              '2. Confirme o provedor de rastreamento:',
              'Verifique se você está utilizando o site ou aplicativo correto para rastrear seu pacote. Dependendo do serviço de entrega, pode haver diferentes sites ou aplicativos para rastreamento.',
            ),
            SizedBox(height: 8),
            buildErroItem(
              context,
              '3. Tente Novamente Mais Tarde:',
              'Às vezes, o sistema de rastreamento pode estar temporariamente fora do ar. Tente atualizar o status de entrega mais tarde para ver se o erro persiste.',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildErroItem(BuildContext context, String title, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        SizedBox(height: 4),
        Text(
          description,
          style: TextStyle(fontSize: 14, color: Colors.black),
        ),
      ],
    );
  }
}
