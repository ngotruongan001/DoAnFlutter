import 'package:flutter/material.dart';
import 'package:theodoisuckhoe_app/screens/page/profile/index.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePage createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child:
          SafeArea(
            child: Container(
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
              ),
              child: Column(
                children: [
                  Container(
                    height: 80,
                    child: Center(
                      child: Text("Cá nhân", style: TextStyle(color: Colors.white, fontSize: 20),),
                    ),
                  ),
                  Container(
                    height: 800,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(40), topLeft: Radius.circular(40))
                    ),
                    child: Container(
                      child: Profile(),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}
