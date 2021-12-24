import 'package:flutter/material.dart';
import 'package:theodoisuckhoe_app/details/ListViewNews.dart';
import 'package:theodoisuckhoe_app/details/News/ListNews.dart';

class NewsPage extends StatefulWidget {
  var title;
  NewsPage(this.title);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
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
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(40), topLeft: Radius.circular(40))
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30.0,
                        ),
                        ListViewNews(),
                        ListNews(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}
