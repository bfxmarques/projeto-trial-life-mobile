import 'package:flutter/material.dart';

class HistoricoPage extends StatelessWidget {
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
        title: Text('Cliente - Histórico entregas'),
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
              'Histórico de Encomendas',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(height: 16),
            buildHistoricoItem(context, '02/10/2023', 'Pendente', [
              {'pedido': '000012', 'destino': 'Sorocaba - SP'},
              {'pedido': '000013', 'destino': 'Sorocaba - SP'},
              {'pedido': '000014', 'destino': 'Sorocaba - SP'}
            ]),
            SizedBox(height: 16),
            buildHistoricoItem(context, '02/10/2023', 'Concluído', [
              {'pedido': '000052', 'destino': 'Itapeva - SP'},
              {'pedido': '000047', 'destino': 'Itapeva - SP'}
            ]),
          ],
        ),
      ),
    );
  }

  Widget buildHistoricoItem(BuildContext context, String date, String status, List<Map<String, String>> pedidos) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          date,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        Text(
          status,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: status == 'Pendente' ? Colors.red : Colors.green),
        ),
        SizedBox(height: 8),
        Table(
          border: TableBorder.all(color: Colors.black, width: 0.5),
          columnWidths: {
            0: FixedColumnWidth(100),
            1: FlexColumnWidth(),
          },
          children: [
            TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'nºpedido',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'destino',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),
              ],
            ),
            for (var pedido in pedidos)
              TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(pedido['pedido']!),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(pedido['destino']!),
                  ),
                ],
              ),
          ],
        ),
        SizedBox(height: 16),
        Divider(color: Colors.red, thickness: 2),
      ],
    );
  }
}
