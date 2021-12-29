import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:theodoisuckhoe_app/screens/page/profile/component/create_profile.dart';
import 'package:theodoisuckhoe_app/screens/page/profile/models/user_profile.dart';

class Dmc extends StatefulWidget {
  @override
  _DmcState createState() => _DmcState();
}

class _DmcState extends State<Dmc> {
  final _formKey = GlobalKey<FormState>();

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

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: <Widget>[
                  Column(
                      children: [
                        if(loggedInUser.fullName == null)
                          Text("Chưa cập nhật...",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ))

                        ,
                        if(loggedInUser.fullName != null)
                          Text("${loggedInUser.fullName} ",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              )),
                      ]
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
              child: Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: <Widget>[
                  Column(
                      children: [
                        if(loggedInUser.date == null)
                          Text("Chưa cập nhật...",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ))

                        ,
                        if(loggedInUser.date != null)
                          Text("${loggedInUser.date} ",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              )),
                      ]
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: <Widget>[
                  Column(
                    children: [
                      if(loggedInUser.phone == null)
                        Text("Chưa cập nhật...",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ))

                      ,
                      if(loggedInUser.phone != null)
                      Text("${loggedInUser.phone} ",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          )),
                    ]
                  ),

                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: <Widget>[

                  Column(
                      children: [
                        if(loggedInUser.cmnd == null)
                          Text("Chưa cập nhật...",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ))

                        ,
                        if(loggedInUser.cmnd != null)
                          Text("${loggedInUser.cmnd} ",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              )),
                      ]
                  ),

                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: <Widget>[
                  Column(
                      children: [
                        if(loggedInUser.email == null)
                          Text("Chưa cập nhật...",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ))

                        ,
                        if(loggedInUser.email != null)
                          Text("${loggedInUser.email} ",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              )),
                      ]
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: <Widget>[
                  Column(
                      children: [
                        if(loggedInUser.address == null)
                          Text("Chưa cập nhật...",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ))

                        ,
                        if(loggedInUser.address != null)
                          Text("${loggedInUser.address} ",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              )),
                      ]
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            GFButton(
              onPressed: () {
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   const SnackBar(content: Text('Đang xử lí')));
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const CreateProflieScreen()));
              },
              text: "Sửa thông tin",
              blockButton: true,
              size: GFSize.LARGE,
              textColor: Colors.white,
              shape: GFButtonShape.pills,
              textStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,

              ),

            ),
          ],
        ),
      ),
    );
  }
}
