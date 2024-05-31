import 'package:flutter/material.dart';
import 'rastreio.dart';

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
  TextEditingController _cpfController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();
  final String _cpfTeste = '44164085878';
  final String _senhaTeste = '981777432fe';

  @override
  void dispose() {
    _cpfController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
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
                        'CPF',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 5),
                      TextFormField(
                        controller: _cpfController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          hintText: 'Digite seu CPF',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Por favor, digite o CPF';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Senha',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 5),
                      TextFormField(
                        controller: _senhaController,
                        obscureText: true,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          hintText: 'Digite sua senha',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Por favor, digite a senha';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 100),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          _formKey.currentState?.save();
                          if (_cpfController.text == _cpfTeste && _senhaController.text == _senhaTeste) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => RastreioPage(codigo: _cpfController.text)),
                            );
                          } else {
                            _showLoginDialog('CPF ou senha incorretos');
                          }
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                      ),
                      child: Text('Entrar', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  SizedBox(height: 200),
                  Container(
                    height: 4,
                    color: Colors.red,
                  ),
                  SizedBox(height: 3),
                  Container(
                    height: 2,
                    color: Colors.yellow,
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showLoginDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Login'),
          content: Text(message),
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
