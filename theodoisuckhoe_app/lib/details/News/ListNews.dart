import 'package:flutter/material.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';
import 'package:theodoisuckhoe_app/viewmodel/ViewModel.dart';
import 'package:url_launcher/url_launcher.dart';

class ListNews extends StatefulWidget {
  const ListNews({Key? key}) : super(key: key);

  @override
  _ListNewsState createState() => _ListNewsState();
}

class _ListNewsState extends State<ListNews> {
  var url ="https://baomoi.com/api/v1/content/get/list-by-custom?listType=tag&keyword=api&page=2&ctime=1640162465&version=0.1.92&sig=e7ae0d4ac0a6830f42d8f8583b782f39bbf8891277b33c6fafc69ea37455dfad&apiKey=kI44ARvPwaqL7v0KuDSM0rGORtdY1nnw";
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
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Tin tức thêm",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
        ViewModelProvider<HomeViewModel>.withConsumer(
          viewModelBuilder: () => HomeViewModel(),
          onModelReady: (model) async {
            model.getNewsData(url);
          },
          builder: (context, model, child) => Container(
              margin: EdgeInsets.only(left: 10.0, right: 10.0),
              child:  model.newsItems.length == 0
                  ?Container(child: Center(child: Text("Loading...", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22.0),)))
                  : Column(
                  children: model.newsItems
                      .map((e)=> GestureDetector(
                    onTap: (){
                      _launched = _launchInBrowser('https://baomoi.com${e.link}');
                    },
                    child: Container(
                      height: 100,
                      margin: EdgeInsets.only(top: 15.0),
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: NetworkImage(e.image),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Text(
                                e.title,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )).toList()
              )
          ),
        ),
      ],
    );
  }
}