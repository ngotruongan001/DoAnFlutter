import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:theodoisuckhoe_app/model/user_model.dart';
import 'package:theodoisuckhoe_app/screens/login_screen.dart';
import 'package:theodoisuckhoe_app/screens/page/profile/component/user.dart';
import 'package:theodoisuckhoe_app/screens/page/profile/models/user_profile.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  User? user1 = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser1 = UserModel();

  User? user = FirebaseAuth.instance.currentUser;
  UserProfileModel loggedInUser = UserProfileModel();
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("profileUsers")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserProfileModel.fromMap(value.data());
      setState(() {});
    });
  }

  void initState1() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser1 = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          Container(
            margin: EdgeInsets.only(top: 15),
            child:
            Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (loggedInUser.fullName == null)
                  Text("${loggedInUser1.secondName} ${loggedInUser1.firstName} ",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      )),
                  if (loggedInUser.fullName != null)
                    Text("${loggedInUser.fullName}  ",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        )),
                ]
              ),
            ),

          SizedBox(height: 20),
          ProfileMenu(
            text: "Thông tin cá nhân",
            icon: "assets/icons/people.svg",
            press: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Users()))
            },
          ),
          ProfileMenu(
            text: "Thành viên gia đình ",
            icon: "assets/icons/family-parents.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Nơi đã đến",
            icon: "assets/icons/maps-black.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Lịch sử đặt khám",
            icon: "assets/icons/calendar.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Cài đặt",
            icon: "assets/icons/settings.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Đăng xuất",
            icon: "assets/icons/logout.svg",
            press: () {
              logout(context);
            },
          ),
        ],
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
