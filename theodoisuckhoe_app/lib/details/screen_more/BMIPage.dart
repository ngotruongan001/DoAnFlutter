import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BMIPage extends StatefulWidget {
  const BMIPage({Key? key}) : super(key: key);

  @override
  _BMIPageState createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {

  String? txt = '';
  int? _weight = 0;
  int? _meter = 0;
  int? _cent = 0;
  int? _age = 0;
  var _bmi = 0.0;

  var currentindex = 0;

  void _changText(){
    String? text;

    if(_weight == 0){
      text = 'nhập cân nặng vào';
      setState(() {
        txt = text;
      });
      return;
    }

    double _chieuCao = _meter! + (_cent! / 100);
    if(_chieuCao == 0){
      text = 'nhập chiều cao vào';
      setState(() {
        txt = text;
      });
      return;
    }

    var BMI = (_weight!/(_chieuCao * _chieuCao));
    print(BMI);

    if(BMI < 18.5){
      text = 'Cân nặng thấp (gầy)';
    }else if(BMI < 25){
      text = 'Bình thường';
    } else if(BMI == 25){
      text = 'Thừa cân';
    }else if(BMI < 30){
      text = 'Tiền béo phì	';
    }else if(BMI < 35){
      text = ' Béo phì độ I';
    }else if(BMI < 40){
      text = ' Béo phì độ II';
    }else{
      text = 'Béo phì độ III';
    }
    setState(() {
      txt = text;
      _bmi = BMI;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 20,),
            Row(
              children: [
                radioButton("Man",Colors.blue, 0),
                radioButton("Woman",Colors.pink, 1),
              ],

            ),
            SizedBox(height: 35,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Cân nặng (kg)",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.lightBlueAccent,
                          ),
                          textAlign: TextAlign.left,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: TextField(
                            maxLines: 1,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                                fontSize: 14
                            ),
                            decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.lightBlue, width: 1.0),
                              ),
                              labelText: 'cân nặng',
                            ),
                            onChanged: (value)  {
                              int? i;
                              if(value == ''){
                                i = 0;
                              }
                              else{
                                i = int.parse(value);
                              }
                              setState(() {
                                _weight = i;
                              });
                              print(_weight);
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Lứa tuổi",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.lightBlueAccent,
                          ),
                          textAlign: TextAlign.left,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: TextField(
                            maxLines: 1,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                                fontSize: 14
                            ),
                            decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.lightBlue, width: 1.0),
                              ),
                              labelText: '19',
                            ),
                            onChanged: (value)  {
                              int? i;
                              if(value == ''){
                                i = 0;
                              }
                              else{
                                i = int.parse(value);
                              }
                              setState(() {
                                _age = i;
                              });
                              print(_age);
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 35,),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      child:
                        Text(
                          "Chiều cao:",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlueAccent,
                          ),
                          textAlign: TextAlign.left,
                        )
                      ,
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "meter",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.lightBlueAccent,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: TextField(
                            maxLines: 1,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                                fontSize: 14
                            ),
                            decoration: InputDecoration(
                              hintText: '1 m',
                              contentPadding: EdgeInsets.all(20.0),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.lightBlue, width: 1.0),
                              ),
                            ),
                            onChanged: (value)  {
                              int? i;
                              if(value == ''){
                                i = 0;
                              }
                              else{
                                i = int.parse(value);
                              }
                              setState(() {
                                _meter = i;
                              });
                              print(_meter);
                            },
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Text(
                              "centimeter",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.lightBlueAccent,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: TextField(
                            maxLines: 1,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                                fontSize: 14
                            ),
                            decoration: InputDecoration(
                              hintText: '65 cm',
                              contentPadding: EdgeInsets.all(20.0),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.lightBlue, width: 1.0),
                              ),
                            ),
                            onChanged: (value)  {
                              int? i;
                              if(value == ''){
                                i = 0;
                              }
                              else{
                                i = int.parse(value);
                              }
                              setState(() {
                                _cent = i;
                              });
                              print(_cent);
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 35,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: ()=> {
                    _changText()
                  },
                  child: Container(
                    width: 150,
                    height: 44,
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
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Center(
                        child: Text("Nhập", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),)
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 35,),
            Column(
              children: [
                Text("Kết quả:", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Text(
                      txt.toString() + (_bmi == 0 ? "" : " : " +_bmi.toStringAsFixed(1).toString()),
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w400,
                          color:_bmi < 18.5 ?Colors.yellow
                                :_bmi <= 25? Colors.green
                                  : Colors.red
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget radioButton(String value, Color color, int index){
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12.0),
        height: 80.0,
        child: FlatButton(
          color: currentindex == index ?  color : Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0)
          ),
          onPressed: () {
            setState(() {
              currentindex = index;
            });
            },
          child: Text(value, style: TextStyle(
            color: currentindex == index ? Colors.white : color,
            fontSize: 20.0,
            fontWeight: FontWeight.bold
          ),)
        )
      ),
    );
  }
}
