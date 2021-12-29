import 'package:flutter/material.dart';
import 'package:theodoisuckhoe_app/details/ListViewNews.dart';
import 'package:theodoisuckhoe_app/details/News/NewsPages.dart';

class WrraperNews extends StatefulWidget {
  const WrraperNews({Key? key}) : super(key: key);

  @override
  _WrraperNewsState createState() => _WrraperNewsState();
}

class _WrraperNewsState extends State<WrraperNews> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tin tức hôm nay",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  NewsPage("Tin tức hôm nay"),
                        ),
                      );
                    },
                    child: Text(
                      "Tất cả",
                      style: TextStyle(
                          fontSize: 16,
                          // fontWeight: FontWeight.bold,
                          color: Colors.blue
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListViewNews(),
          ],
        ),
      ),
    );
  }
}
