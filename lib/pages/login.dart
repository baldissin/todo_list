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
                    labelText: 'Usuário',
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
                ElevatedButton(onPressed: login, child: const Text('Entrar')),
              ],
            )),
      ),
    );
  }

  void login() async {
    var url = Uri.parse('http://localhost:8080/admin/login');
    var body = jsonEncode(<String, dynamic>{
      'login': loginController.text,
      'password': passwordController.text,
    });

    var response = await http.post(url, body: body, headers: {
      'Content-Type': 'application/json',
    });

    print(response.body.toString());

    // String title = '';
    // String message = '';
    //
    // if (response.statusCode == 200) {
    //   title = 'Logou';
    //   message = 'Autenticado com sucesso';
    // } else {
    //   title = 'algo deu errado';
    //   message = response.body.toString();
    // }

    //showAlertDialog(context, title, message);
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
