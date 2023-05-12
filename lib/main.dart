import 'package:flutter/material.dart';
import 'package:todo_list/pages/login_page.dart';
import 'package:todo_list/pages/todo_list_page.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodoListPage()
    );
  }
}