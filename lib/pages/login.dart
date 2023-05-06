import 'package:flutter/material.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({Key? key}) : super(key: key);

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
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Usuário',
                    errorText: null,
                  ),
                ),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    errorText: null,
                  ),
                  obscureText: true,
                ),
              ],
            )),
      ),
    );
  }
}
