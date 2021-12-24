
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewspaperPage extends StatefulWidget {
  var id;
  var title;
  var image;
  var link;
  NewspaperPage(this.id, this.title, this.image, this.link);


  @override
  _NewspaperPageState createState() => _NewspaperPageState();
}

class _NewspaperPageState extends State<NewspaperPage> {


  Future<void>? _launched;

  Future<void> _launchInBrowser(String url) async {
    await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        _launched = _launchInBrowser('https://baomoi.com${widget.link}');
      },
      child: Container(
        margin: EdgeInsets.only(left: 10),
        height: 200,
        width: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: NetworkImage(widget.image),
            fit: BoxFit.fill,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(0, 3),
            )
          ],
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 70,
                width: MediaQuery.of(context).size.width ,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(widget.title,overflow: TextOverflow.ellipsis,maxLines: 2, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
