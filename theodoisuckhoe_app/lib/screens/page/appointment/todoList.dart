
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class ToDoList extends StatefulWidget {
  const ToDoList({Key? key}) : super(key: key);


  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  List todos = [];
  String input = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightBlueAccent,
          onPressed: (){
            showDialog(
                context: context,
                builder: (BuildContext context)
                {
                  return AlertDialog(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                    ),
                    title: Text("Tạo ghi chú"),
                    content: TextField(
                      onChanged: (String value){
                        input = value;
                      },
                    ),
                    actions: <Widget>[
                      // ignore: deprecated_member_use
                      FlatButton(
                          onPressed: (){
                            setState(() {
                              todos.add(input);
                            });
                            Navigator.of(context).pop();
                          },
                          child: Text("Tạo"))
                    ],
                  );
                }
            );
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          )
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: todos.length,
            itemBuilder: (BuildContext context,int index){
              return Dismissible(
                key: Key(todos[index]),
                child: Card(
                  color: Color(0xFF00CCFF).withOpacity(0.7),

                  margin: EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)
                  ),
                  child: ListTile(
                    title: Text(todos[index], style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete,
                          color: Colors.red),
                      onPressed: (){
                        setState(() {
                          todos.removeAt(index);
                        });
                      },
                    ),
                  ),
                ),);
            }),
      ),
    );;
  }
}

