import '../model/CardItem.dart';
import 'package:flutter/material.dart';
import '../model/FeatureItem.dart';

class ListCards {
  static List<CardItem> getListCard(){
    return [
      new CardItem(1,"Khai báo y tế", Icons.assignment, Color(0xFF3366FF),Color(0xFF00CCFF)),
      new CardItem(2,"Tình hình covid", Icons.shield, Color(0xFF25D03C),Color(0xFF33FF85)),
      new CardItem(3,"Tư vấn sức khỏe F0", Icons.phone_forwarded, Color(0xFFDE3F32),Color(0xFFEE6262)),
    ];
  }

  static List<FeatureItem> getListFeature(){
    return [
      new FeatureItem(
          1,
          "Phản ứng sau tiêm",
          Icons.ac_unit_outlined,
          Color(0xFF3366FF),
          Center(child: Text("Khong co data"))
      ),
      new FeatureItem(
          2,
          "Đăng ký tiêm chủng",
          Icons.note_add_outlined,
          Color(0xFF3366FF),
          Center(child: Text("Khong co data"))
      ),
      new FeatureItem(
          3,
          "Đặt hẹn khám",
          Icons.calendar_today_rounded,
          Color(0xFF3366FF),
          Center(child: Text("Khong co data"))
      ),
      new FeatureItem(
          4,
          "Hồ sơ sức khỏe",
          Icons.assignment_ind,
          Color(0xFF3366FF),
          Center(child: Text("Khong co data"))
      ),
      new FeatureItem(
          5,
          "Tư vấn từ xa",
          Icons.phone_in_talk_sharp,
          Color(0xFF3366FF),
          Center(child: Text("Khong co data"))
      ),
      new FeatureItem(
          6,
          "Xem thêm",
          Icons.more_horiz,
          Color(0xFF3366FF),
          Center(child: Text("Khong co data"))
      ),
    ];
  }

}

