import 'package:flutter/material.dart';

class ErroAttEntregaPage extends StatelessWidget {
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
        title: Text('Erro ao atualizar o status da entrega'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Erro ao atualizar o status da entrega?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(height: 16),
            buildErroItem(
              context,
              '1. Verifique os Detalhes do Pedido:',
              'Comece verificando os detalhes do pedido, como número do pedido, número de rastreamento, data de entrega estimada e endereço de entrega. Certifique-se de que todas essas informações estejam corretas.',
            ),
            SizedBox(height: 8),
            buildErroItem(
              context,
              '2. Verifique a Conexão à Internet:',
              'Certifique-se de estar conectado à Internet para garantir que a plataforma de rastreamento possa se comunicar com os servidores da transportadora.',
            ),
            SizedBox(height: 8),
            buildErroItem(
              context,
              '3. Limpe o Cache do Navegador ou Aplicativo:',
              'Se você estiver usando um aplicativo ou site para rastrear a entrega, tente limpar o cache do seu navegador ou do aplicativo. Às vezes, dados antigos em cache podem causar problemas.',
            ),
            SizedBox(height: 8),
            buildErroItem(
              context,
              '4. Tente Novamente Mais Tarde:',
              'Às vezes, o sistema de rastreamento pode estar temporariamente fora do ar. Tente atualizar o status de entrega mais tarde para ver se o erro persiste.',
            ),
            SizedBox(height: 8),
            buildErroItem(
              context,
              '5. Contate o Suporte ao Cliente:',
              'Se o erro continuar, entre em contato com o suporte ao cliente da empresa de transporte ou da loja online. Eles podem fornecer assistência direta e verificar o status da sua entrega.',
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
