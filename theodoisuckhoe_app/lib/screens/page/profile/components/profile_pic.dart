import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:theodoisuckhoe_app/screens/page/profile/models/user_profile.dart';

class ProfilePic extends StatefulWidget {
  const ProfilePic({Key? key}) : super(key: key);

  @override
  _ProfilePicState createState() => _ProfilePicState();

}

class _ProfilePicState extends State<ProfilePic> {
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

    var urlImage; urlImage= loggedInUser.image;
    return SingleChildScrollView(
      child: ClipRect (
        child: SizedBox(
          height: 115,
          width: 115,
          child: Stack(
            fit: StackFit.expand,
            clipBehavior: Clip.none,
            children: [
              if (urlImage == null)
                Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                        border: Border.all(width:3,color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(100))
                    ),
                    child: Icon(Icons.image,
                        size: 60, color: Theme.of(context).primaryColor)),
              if (urlImage != null)
              CircleAvatar(

                backgroundImage: NetworkImage (
                    urlImage)
              ),

            ],
          ),
        ),
      ),
    );
  }
}
