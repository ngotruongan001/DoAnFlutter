import 'package:flutter/material.dart';

class PageCityCovid extends StatefulWidget {
  var name;
  var death;
  var treating;
  var cases;
  var recovered;
  PageCityCovid(this.name, this.death, this.treating, this.cases, this.recovered);

  @override
  _PageCityCovidState createState() => _PageCityCovidState();
}

class _PageCityCovidState extends State<PageCityCovid> {
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
                          child: Text(widget.name, style: TextStyle(color: Colors.white, fontSize: 20),),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(40), topLeft: Radius.circular(40))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Column(
                        children: [
                          SizedBox(height: 40,),
                          Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(width: 5.0, color: Colors.lightBlue.shade900),
                                  )
                              ),
                              height: 60,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Tử vong',
                                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                      widget.death,
                                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.red)
                                  )
                                ],
                              )
                          ),
                          Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(width: 5.0, color: Colors.lightBlue.shade900),
                                  )
                              ),
                              height: 60,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Điều trị',
                                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                      widget.treating,
                                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.blue)
                                  )
                                ],
                              )
                          ),
                          Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(width: 5.0, color: Colors.lightBlue.shade900),
                                  )
                              ),
                              height: 60,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Trường hợp',
                                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                      widget.cases,
                                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.yellow)
                                  )
                                ],
                              )
                          ),
                          Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(width: 5.0, color: Colors.lightBlue.shade900),
                                  )
                              ),
                              height: 60,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Hồi phục',
                                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                      widget.recovered,
                                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.green)
                                  )
                                ],
                              )
                          ),
                        ],
                      ),
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
