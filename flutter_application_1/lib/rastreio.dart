import 'package:flutter/material.dart';
import 'infoentrega.dart'; 
import 'historico.dart'; 
import 'suporte.dart'; 
import 'main.dart'; // Importe a sua classe principal

class RastreioPage extends StatelessWidget {
  final String codigo;

  RastreioPage({required this.codigo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, size: 50), 
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'TRAIL LIFE',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                  Text(
                    'TRANSPORTADORA',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.local_shipping, color: Colors.orange),
              title: Text('Encomendas'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.history, color: Colors.orange),
              title: Text('Histórico'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HistoricoPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.support, color: Colors.orange),
              title: Text('Suporte'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SuportePage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app, color: Colors.red),
              title: Text('Sair'),
              onTap: () {
                _showExitConfirmation(context);
              },
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'by Easy Virtual',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 24),
          Center(
            child: Text(
              'TRIAL LIFE',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.red),
            ),
          ),
          SizedBox(height: 8),
          Center(
            child: Text(
              'TRANSPORTADORA',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
          ),
          SizedBox(height: 16),
          SizedBox(
            height: 80, // Espaçamento entre o texto superior e o conteúdo abaixo
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              'Encomendas à Receber',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 16),
          buildEncomendaItem(context, '000052'),
          SizedBox(height: 8),
          buildEncomendaItem(context, '--'),
          SizedBox(height: 8),
          buildEncomendaItem(context, '--'),
          SizedBox(height: 8),
          buildEncomendaItem(context, '--'),
        ],
      ),
    );
  }

  Widget buildEncomendaItem(BuildContext context, String codigoRastreio) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Icon(Icons.circle, size: 14, color: Colors.red),
                SizedBox(width: 8),
                Text(codigoRastreio, style: TextStyle(fontSize: 18, color: Colors.black)),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InfoEntregaPage(codigo: codigoRastreio)),
              );
            },
            child: Icon(Icons.arrow_forward, size: 18, color: Colors.red),
          ),
        ],
      ),
    );
  }

  void _showExitConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(Icons.arrow_back, color: Colors.red),
              SizedBox(width: 8),
              Text(''),
            ],
          ),
          content: Text('Tem certeza que deseja sair?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar', style: TextStyle(color: Colors.red)),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => TrailLifeMotoristaLoginApp()), // Substitua por TrailLifeMotoristaLoginApp
                  (Route<dynamic> route) => false,
                );
              },
              child: Text('Confirmar', style: TextStyle(color: Colors.green)),
            ),
          ],
        );
      },
    );
  }
}
