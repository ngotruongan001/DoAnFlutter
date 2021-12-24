import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  var title;
  DetailsPage(this.title){}

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
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
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(40), topLeft: Radius.circular(40))
                  ),
                  child: Center(child: Text("Chua co data")),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
