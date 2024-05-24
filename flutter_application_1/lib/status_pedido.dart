import 'package:flutter/material.dart';

class StatusPedidoPage extends StatelessWidget {
  final String codigo;

  StatusPedidoPage({required this.codigo});

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
        title: Text('Cliente - Status da Entrega'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Text(
              'Points de atualização',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(height: 16),
            Text(
              'Prazo de Entrega Estimado - xx/xx/xxxx',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            SizedBox(height: 16),
            buildStatusItem('Em separação', 'xx/xx/xxxx'),
            buildStatusItem('Em Trânsito - Cidade tal', 'xx/xx/xxxx'),
            buildStatusItem('Em Trânsito - Cidade tal', 'xx/xx/xxxx'),
            buildStatusItem('Coletado pela Trail Life', 'xx/xx/xxxx'),
            buildStatusItem('Entregue', 'xx/xx/xxxx'),
          ],
        ),
      ),
    );
  }

  Widget buildStatusItem(String status, String date) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Column(
            children: [
              Icon(Icons.circle, size: 14, color: Colors.orange),
              Container(
                height: 30,
                width: 1,
                color: Colors.orange,
              ),
            ],
          ),
          SizedBox(width: 8),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  status,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                Text(
                  date,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
