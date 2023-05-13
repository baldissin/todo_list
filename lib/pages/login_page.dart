import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';


class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/images/homeIcon.png', height: 150, width: 150),
                TextField(
                  controller: loginController,
                  decoration: const InputDecoration(
                    labelText: 'Usuárioo',
                    errorText: null,
                  ),
                ),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Senha',
                    errorText: null,
                  ),
                  obscureText: true,
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: ElevatedButton(onPressed: () => onPressed(context), child: const Text('Entrar')),
                ),
              ],
            )),
      ),
    );
  }

  void onPressed(BuildContext context) async {
    String title = 'Algo deu errado';
    String message = '';

    var url = Uri.parse('http://localhost:8080/admin/login');
    var body = jsonEncode(<String, dynamic>{
      'login': loginController.text,
      'password': passwordController.text,
    });

    try {
      var response = await http.post(url, body: body, headers: {
        'Content-Type': 'application/json',
      });

    if (response.statusCode == 200) {
      title = 'Entrou';
    } else {
      //usuario ou senha errados
    }
      message = response.body.toString();

    } on Exception catch (_, e){
      message = 'Sem Conexão.';
    }

    showAlertDialog(context, title, message);
  }

  void showAlertDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              child: Text('Fechar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

}
