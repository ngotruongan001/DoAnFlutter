import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/box.dart';

import 'more/RadioChecked.dart';


class HealthDeclaration extends StatefulWidget {
  var title;
  HealthDeclaration(@required this.title){}

  @override
  _HealthDeclarationState createState() => _HealthDeclarationState();
}

class _HealthDeclarationState extends State<HealthDeclaration> {


  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.black;
    }
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topRight: Radius.circular(40), topLeft: Radius.circular(40))
      ),
      child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(height: 50,),
                Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Text(
                          "THÔNG TIN KHAI BÁO Y TẾ",
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),)
                    ),
                    Center(
                        child:
                        Text(
                          "Khuyến cáo: Khai báo thông tin sai là vi phạm pháp luật Việt Nam và có thể xử lý hình sự",
                          style: TextStyle(color: Colors.red,fontWeight: FontWeight.w400, fontSize: 15),
                          textAlign: TextAlign.center,
                        )
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Card(
                      elevation:5,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                checkColor: Colors.white,
                                fillColor: MaterialStateProperty.resolveWith(getColor),
                                value: isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked = value!;
                                  });
                                }
                              ),
                              Text("Khai hộ")
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20, top:20, bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("TINH", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                                Text("Chi tiết", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: Colors.blue),)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Card(
                      elevation:5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Row(
                              children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.85,
                                    margin: EdgeInsets.only(top: 15, left: 20),
                                    child: Text(
                                      "Trong vòng 14 ngày qua, Anh/Chị có đến tỉnh/thành phố, quốc gia/vùng lãnh thổ nào (Có thể đi qua nhiều nơi)?",
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ),
                              ],
                            ),
                          RadioChecked(),
                        ],
                      ),
                    ),
                    Card(
                      elevation:5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.85,
                                margin: EdgeInsets.only(top: 15, left: 20),
                                child: Text(
                                  "Trong vòng 14 ngày qua, Anh/Chị có thấy xuất hiện ít nhất 1 trong các dấu hiệu: sốt, ho, khó thở, viêm phổi, đau họng, mệt mỗi không?",
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                          RadioChecked()
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top:20, left: 10, bottom: 20, right: 20),
                  child: Text(
                      "Dữ liệu bạn cung cấp hoàn toàn bảo mật và chỉ phục vụ cho việc phòng chống dịch, thuộc quản lí của Ban chỉ đạo quốc gia về Phòng chống dịch Covid-19. Khi bạn nhấn nút Gửi là bạn đã hiểu và đồng ý",
                    style: TextStyle(fontSize: 14),
                  )
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){print("Gui thong tin");},
                      child: Container(
                        width: 220,
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
                          child: Text("Gửi tờ khai", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),)
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
      ),
    );
  }
}
