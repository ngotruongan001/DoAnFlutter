
import 'package:flutter/material.dart';
import 'package:theodoisuckhoe_app/details/DetailsPage.dart';


class FeatureItem extends StatefulWidget {
  var title;
  var icon;
  var color;
  FeatureItem(this.title, this.icon, this.color);

  @override
  _FeatureItemState createState() => _FeatureItemState();
}

class _FeatureItemState extends State<FeatureItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
              DetailsPage(widget.title)
          ),
        );
      },
      child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50)
                ),
                child: Icon(
                  widget.icon,
                  size: 45,
                  color: widget.color,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Text(
                  widget.title,
                  style: TextStyle(
                      fontSize: 16.0
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          )
      ),
    );
  }
}
