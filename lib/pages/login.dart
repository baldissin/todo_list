import 'package:flutter/material.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Login',
                    errorText: null,
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Password',
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
