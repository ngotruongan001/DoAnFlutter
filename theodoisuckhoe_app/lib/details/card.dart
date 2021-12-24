import 'package:flutter/material.dart';
import 'package:theodoisuckhoe_app/details/Declare.dart';
import 'package:theodoisuckhoe_app/details/DetailsPage.dart';
import 'package:theodoisuckhoe_app/details/detailsCard/ViewCovidPage.dart';

class CardItemScreen extends StatefulWidget {
  var id;
  var title;
  var icon;
  var color1;
  var color2;

  CardItemScreen(var id,var title, var icon, var color1, var color2){
    this.id = id;
    this.title = title;
    this.icon = icon;
    this.color1 = color1;
    this.color2 = color2;
  }

  @override
  _CardState createState() => _CardState();
}

class _CardState extends State<CardItemScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                widget.id == 1
                    ?Declare(widget.title)
                    : widget.id == 2 ? ViewCovidPage(widget.title) : DetailsPage(widget.title)
                )
          );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.29,
        height: 145,
        decoration: BoxDecoration(
          gradient:  LinearGradient(
            colors: [
              widget.color1,
              widget.color2,
            ],
            begin: FractionalOffset(0.5, 1.0),
            end: FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            // tileMode: TileMode.clamp
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: widget.color1.withOpacity(0.5), //                   <--- border color
                  width: 5.0,
                ),
              ),
              child: Icon(
                widget.icon,
                size: 30.0,
                color: widget.color1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Text(
                widget.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
