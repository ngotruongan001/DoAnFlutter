import 'package:flutter/material.dart';
import 'package:theodoisuckhoe_app/details/screen_more/HealthDeclaration.dart';

class Declare extends StatefulWidget {
  var title;
  Declare(this.title){}
  @override
  _DeclareState createState() => _DeclareState();
}

class _DeclareState extends State<Declare> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              decoration: BoxDecoration(
                gradient:  LinearGradient(
                  colors: [
                    Color(0xFF3366FF),
                    Color(0xFF00CCFF),
                  ],
                  begin: FractionalOffset(0.0, 1.0),
                  end: FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  // tileMode: TileMode.clamp
                ),
              ),
              child: Column(
                children: [
                  Container(
                    height: 80,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                              onPressed: ()=>{ Navigator.pop(context)},
                              icon: Icon(Icons.arrow_back, size: 30, color: Colors.white,)
                          ),
                        ),
                        Center(
                          child: Text(widget.title, style: TextStyle(color: Colors.white, fontSize: 20),),
                        ),
                      ],
                    ),
                  ),
                  HealthDeclaration(widget.title),
                ],
              ),
            ),
          ),
        )
    );
  }
}
