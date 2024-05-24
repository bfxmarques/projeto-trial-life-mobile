import 'package:flutter/material.dart';
import 'rastreio.dart'; // Importando a tela de rastreio

void main() {
  runApp(TrailLifeMotoristaLoginApp());
}

class TrailLifeMotoristaLoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trail Life Motorista',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TrailLifeMotoristaLogin(),
    );
  }
}

class TrailLifeMotoristaLogin extends StatefulWidget {
  @override
  _TrailLifeMotoristaLoginState createState() => _TrailLifeMotoristaLoginState();
}

class _TrailLifeMotoristaLoginState extends State<TrailLifeMotoristaLogin> {
  final _formKey = GlobalKey<FormState>();
  String _codigo = '';
  TextEditingController _codigoController = TextEditingController();

  @override
  void dispose() {
    _codigoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'TRAIL LIFE',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.red),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'TRANSPORTADORA',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 50),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Código de Rastreio',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 5),
                    TextFormField(
                      controller: _codigoController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        hintText: 'Digite',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Por favor, digite o código de rastreio';
                        }
                        return null;
                      },
                      onSaved: (value) => _codigo = value ?? '',
                    ),
                  ],
                ),
                SizedBox(height: 100), // Espaçamento entre o campo de entrada e o botão Entrar
                SizedBox(
                  width: double.infinity, // Ajuste para o botão ocupar toda a largura disponível
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        _formKey.currentState?.save();
                        _showLoginDialog();
                        _codigoController.clear();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RastreioPage(codigo: _codigo)), // Navega para a tela de rastreio
                        );
                      }
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.red;
                        }
                        return Colors.white;
                      }),
                      overlayColor: MaterialStateProperty.all<Color>(Colors.red.withOpacity(0.1)),
                      side: MaterialStateProperty.all<BorderSide>(BorderSide(color: Colors.red, width: 2)),
                    ),
                    child: Text('Entrar', style: TextStyle(color: Colors.red)),
                  ),
                ),
                SizedBox(height: 200), // Espaçamento entre o botão Entrar e as linhas vermelha e amarela
                Container(
                  height: 4,
                  color: Colors.red,
                ),
                SizedBox(height: 3),
                Container(
                  height: 2,
                  color: Colors.yellow,
                ),
                SizedBox(height: 40), // Espaçamento entre as linhas e o final da tela
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showLoginDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Login'),
          content: Text('Código de Rastreio: $_codigo'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
