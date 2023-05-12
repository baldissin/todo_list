import 'package:flutter/material.dart';

class TodoListPage extends StatefulWidget {
  TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  List<String> todos = [];

  final TextEditingController todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Icon(
                  Icons.edit_calendar,
                  size: 50,
                  color: Colors.blueAccent,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: todoController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Adicione uma tarefa',
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                      onPressed: () {
                        String text = todoController.text;
                        setState(() {
                          todos.add(text);
                        });
                        todoController.clear();
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(6),
                      ),
                      child: Text(
                        '+',
                        style: TextStyle(fontSize: 40),
                      )),
                ],
              ),
              SizedBox(
                width: 16,
              ),
              Flexible(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    for(String todo in todos)
                      ListTile(
                        title: Text(todo),
                        subtitle: Text('data'),
                      )
                  ],
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Row(
                children: [
                  Expanded(child: Text('Você possui ' + todos.length.toString() +' tarefas pendentes')),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                      ),
                      child: Text('Limpar tudo'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
