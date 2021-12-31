import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:theodoisuckhoe_app/details/FeatureItem.dart';
import 'package:theodoisuckhoe_app/details/WrraperNews.dart';
import 'package:theodoisuckhoe_app/details/card.dart';
import 'package:theodoisuckhoe_app/model/user_model.dart';
import 'package:theodoisuckhoe_app/screens/page/profile/models/user_profile.dart';
import 'package:theodoisuckhoe_app/viewmodel/list_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _cards = ListCards.getListCard();
  List _features = ListCards.getListFeature();

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
      child: SafeArea(
        child: Column(
          children: [
            Container(
              margin:  EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Row(
                children: [
                  Container(
                    height:59,
                    width: 59,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image:  DecorationImage(
                            image: AssetImage("assets/images/ngotruongan.jpg")
                        )
                    ),
                  ),

                  Padding(
                      padding:  EdgeInsets.only(left: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          Text(
                            "Xin Chào",
                            style: TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54
                            ),
                          ),
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
                        ],
                      )
                  )
                ],
              ),
            ),
            Container(
              margin:  EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: _cards.map((e) => CardItemScreen(e.id,e.title, e.icon, e.color1, e.color2)).toList(),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                  color: Colors.blueGrey.withOpacity(0.1)
              ),
              child: Column(
                children: [
                  Container(
                    height: 320,
                    margin: EdgeInsets.only(top: 15),
                    child: GridView(
                        children: _features.map((e) => FeatureItem(e.title, e.icon, e.color)).toList(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                        )
                    ),
                  ),
                  WrraperNews(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
