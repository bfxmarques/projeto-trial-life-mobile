import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'codigo_erro.dart';
import 'erro_att_entrega.dart';
import 'atraso_pedido.dart';

class SuportePage extends StatelessWidget {
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
        title: Text('Cliente - Suporte'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Suporte',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(height: 16),
            buildSuporteItem(context, 'Erro ao atualizar o status da entrega', ErroAttEntregaPage()),
            SizedBox(height: 8),
            buildSuporteItem(context, 'Meu código de rastreio não funciona', CodigoErroPage()),
            SizedBox(height: 8),
            buildSuporteItem(context, 'Meu pedido está em atraso', AtrasoPedidoPage()),
            SizedBox(height: 32),
            Center(
              child: Column(
                children: [
                  Text(
                    'Suporte Direto',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: FaIcon(FontAwesomeIcons.whatsapp, color: Colors.red),
                        onPressed: () {
                          // Implementar ação para WhatsApp
                        },
                      ),
                      SizedBox(width: 32),
                      IconButton(
                        icon: Icon(Icons.email, color: Colors.red),
                        onPressed: () {
                          // Implementar ação para Email
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSuporteItem(BuildContext context, String title, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.red),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            Icon(Icons.arrow_forward, color: Colors.red),
          ],
        ),
      ),
    );
  }
}
