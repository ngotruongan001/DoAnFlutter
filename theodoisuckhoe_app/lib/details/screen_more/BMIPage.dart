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
  var _bmi = 0.0;

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
            Text(
                "BMI",
                style: TextStyle(
                  fontSize: 26, fontWeight: FontWeight.bold,
                )
            ),
            SizedBox(height: 35,),
            Column(
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
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                            child: TextField(
                              autofocus: true,
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
              ],
            ),
            SizedBox(height: 35,),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Chiều cao:",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.lightBlueAccent,
                      ),
                      textAlign: TextAlign.left,
                    )
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "",
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
                            autofocus: true,
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
                    SizedBox(width: 10,),
                    Column(
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
                            autofocus: true,
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
                Text("Đáp án dưới này", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                Row(
                  children: [
                    _bmi == 0 ? Text(""):
                    Text(
                      txt.toString() + " : " +_bmi.toStringAsFixed(1).toString(),
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w400,
                          color:_bmi < 25? Colors.green
                              :_bmi == 25 ?Colors.yellow: Colors.red
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
}
