import 'package:flutter/material.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';
import 'package:theodoisuckhoe_app/details/newspaper.dart';
import 'package:theodoisuckhoe_app/viewmodel/ViewModel.dart';


class ListViewNews extends StatefulWidget {
  const ListViewNews({Key? key}) : super(key: key);

  @override
  _ListViewNewsState createState() => _ListViewNewsState();
}

class _ListViewNewsState extends State<ListViewNews> {

  var url ="https://baomoi.com/api/v1/content/get/list-by-custom?listType=tag&keyword=api&page=2&ctime=1640162465&version=0.1.92&sig=e7ae0d4ac0a6830f42d8f8583b782f39bbf8891277b33c6fafc69ea37455dfad&apiKey=kI44ARvPwaqL7v0KuDSM0rGORtdY1nnw";

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<HomeViewModel>.withConsumer(
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (model) async {
        model.getNewsData(url);
      },
      builder: (context, model, child) => Padding(
        padding: const EdgeInsets.only(left: 5,right: 10),
        child: Container(
          margin: EdgeInsets.only(bottom: 20),
          height: 200,
          child:  model.newsItems.length == 0
              ?Container(child: Center(child: Text("Loading...", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22.0),)))
              :new ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return NewspaperPage(model.newsItems[index].id,model.newsItems[index].title,model.newsItems[index].image,model.newsItems[index].link,);
            },
          ),
        ),
      ),
    );
  }
}
