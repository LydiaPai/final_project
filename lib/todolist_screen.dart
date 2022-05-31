import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends  State<MyApp>{
  List todos = [];
  String input = "";
  @override

  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo_list'),
        backgroundColor: Colors.blueGrey,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder:
              (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(borderRadius:
              BorderRadius.circular(8)),
              title: Text("Add Todolist"),
              content: TextField(
                onChanged: (String value) {
                  input = value;
                },
              ),
              actions: <Widget>[
                FlatButton(
                    onPressed: () {
                      setState(() {
                        todos.add(input);
                      });
                      Navigator.of(context).pop();
                    },
                    child: Text("Add"))
              ],
            );
          });
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
            itemCount: todos.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                  key: Key(todos[index]),
                  child: Card(
                    elevation: 8,
                    margin: EdgeInsets.all(8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    child: ListTile(
                      title: Text(todos[index]),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: (){
                          setState(() {
                            todos.removeAt(index);
                          });
                        }),
                    ),
                  ));
            }),

    );
  }
}