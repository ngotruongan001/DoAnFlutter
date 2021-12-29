import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:theodoisuckhoe_app/screens/page/index.dart';
import 'package:theodoisuckhoe_app/screens/page/profile/components/profile_pic.dart';
import 'package:theodoisuckhoe_app/screens/page/profile/models/user_profile.dart';

class CreateProflieScreen extends StatefulWidget {
  const CreateProflieScreen({Key? key}) : super(key: key);

  @override
  _CreateProflieScreenState createState() => _CreateProflieScreenState();
}

class _CreateProflieScreenState extends State<CreateProflieScreen> {
  final _auth = FirebaseAuth.instance;

  // string for displaying the error Message
  String? errorMessage;
  // our form key
  final _formKey = GlobalKey<FormState>();
  // editing Controller
  final fullNameEditingController = new TextEditingController();
  final dateEditingController = new TextEditingController();
  final phoneEditingController = new TextEditingController();
  final cmndEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final addressEditingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    //first name field
    final fullNameField = TextFormField(
        autofocus: false,
        controller: fullNameEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return ("Tên không được bỏ trống!");
          }
          if (!regex.hasMatch(value)) {
            return ("Nhập tên hợp lệ(Tối thiểu 3 kí tự)!");
          }
          return null;
        },
        onSaved: (value) {
          fullNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            errorMaxLines: 3,
            labelText: "Họ tên",
            labelStyle: TextStyle(color: Colors.black, fontSize: 15)));

    //second name field
    final dateField = TextFormField(
        autofocus: false,
        controller: dateEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Họ không được bỏ trống!");
          }
          return null;
        },
        onSaved: (value) {
          dateEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            suffixIcon: Icon(
              Icons.calendar_today_outlined,
              color: Colors.black,
            ),
            labelText: "Ngày Sinh",
            labelStyle: TextStyle(color: Colors.black, fontSize: 15)));

    //email field
    final phoneField = TextFormField(
      autofocus: false,
      controller: phoneEditingController,
      // keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Vui lòng nhập số điện thoại của bạn!");
        }
        // reg expression for email validation
        if (!RegExp(r'^.{3,}$').hasMatch(value)) {
          return ("Vui lòng nhập đúng số điện thoại!");
        }
        return null;
      },
      onSaved: (value) {
        phoneEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          suffixIcon: Icon(
            Icons.phone_android_outlined,
            color: Colors.black,
          ),
          errorMaxLines: 3,
          labelText: "Số điện thoại",
          labelStyle: TextStyle(color: Colors.black, fontSize: 15)),
    );

    //password field
    final cmndField = TextFormField(
        autofocus: false,
        controller: cmndEditingController,
        obscureText: false,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Mật khẩu bắt buộc để đăng nhập");
          }
          if (!regex.hasMatch(value)) {
            return ("Nhập mật khẩu hợp lệ(Tối thiểu 6 kí tự)");
          }
        },
        onSaved: (value) {
          cmndEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            errorMaxLines: 3,
            labelText: "Số hộ chiếu CMND/CCCD*",
            labelStyle: TextStyle(color: Colors.black, fontSize: 15)));

    final emailField = TextFormField(
      autofocus: false,
      controller: emailEditingController,
      // keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Vui lòng nhập email của bạn!");
        }
        // reg expression for email validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Vui lòng nhập đúng email!");
        }
        return null;
      },
      onSaved: (value) {
        emailEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          suffixIcon: Icon(
            Icons.email_outlined,
            color: Colors.black,
          ),
          errorMaxLines: 3,
          labelText: "Email",
          labelStyle: TextStyle(color: Colors.black, fontSize: 15)),
    );

    final addressField = TextFormField(
      autofocus: false,
      controller: addressEditingController,
      obscureText: false,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Mật khẩu bắt buộc để đăng nhập");
        }
        if (!regex.hasMatch(value)) {
          return ("Nhập mật khẩu hợp lệ(Tối thiểu 6 kí tự)");
        }
      },
      onSaved: (value) {
        cmndEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          suffixIcon: Icon(
            Icons.add_location,
            color: Colors.black,
          ),
          errorMaxLines: 3,
          labelText: "Địa chỉ",
          labelStyle: TextStyle(color: Colors.black, fontSize: 15)),
    );

    final createButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blue,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              postDetailsToFirestore();
            }
          },
          child: Text(
            "Xác nhận thông tin",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

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
                child: Center(
                  child: Text(
                    "Cập Nhật Thông Tin",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              Container(

                height: 800,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40))),
                child: Container(

                    child: SingleChildScrollView(
                      child: Container(
                        height: 900,
                        child: Padding(
                          padding: const EdgeInsets.all(36.0),
                          child: Form(
                            key: _formKey,
                            child: Column(

                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                ProfilePic(),
                                SizedBox(height: 35),
                                fullNameField,
                                SizedBox(height: 20),
                                dateField,
                                SizedBox(height: 20),
                                phoneField,
                                SizedBox(height: 20),
                                cmndField,
                                SizedBox(height: 20),
                                emailField,
                                SizedBox(height: 20),
                                addressField,
                                SizedBox(height: 20),
                                createButton,
                                SizedBox(height: 15),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

            ],
          ),
        ),
      ),
    ));
  }

  postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserProfileModel userProfileModel = UserProfileModel();

    // writing all the values
    userProfileModel.email = user!.email;
    userProfileModel.uid = user.uid;
    userProfileModel.fullName = fullNameEditingController.text;
    userProfileModel.date = dateEditingController.text;
    userProfileModel.phone = phoneEditingController.text;
    userProfileModel.cmnd = cmndEditingController.text;
    userProfileModel.email = emailEditingController.text;
    userProfileModel.address = addressEditingController.text;

    await firebaseFirestore
        .collection("profileUsers")
        .doc(user.uid)
        .set(userProfileModel.toMap());
    Fluttertoast.showToast(msg: "Cập Nhật Thành Công :) ");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => MyHomePage()),
        (route) => false);
  }
}
