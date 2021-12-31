import 'package:flutter/material.dart';
import 'package:theodoisuckhoe_app/screens/page/profile/component/form_information.dart';
import 'package:theodoisuckhoe_app/screens/page/profile/components/profile_pic.dart';
import 'package:theodoisuckhoe_app/screens/page/profile/components/user_image.dart';

class Users extends StatefulWidget {
  const Users({Key? key}) : super(key: key);

  @override
  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
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
                          onPressed: () => {Navigator.pop(context)},
                          icon: Icon(
                            Icons.arrow_back,
                            size: 30,
                            color: Colors.white,
                          )),
                    ),
                    Center(
                      child: Text(
                        'Thông Tin Cá Nhân',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 700,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40))),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      // UserImage(onFileChanged: (String imageUrl) {  },),
                      ProfilePic(),
                      Dmc(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
