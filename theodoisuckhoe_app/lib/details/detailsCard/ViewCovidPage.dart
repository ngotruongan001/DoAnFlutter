import 'package:flutter/material.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';
import 'package:theodoisuckhoe_app/details/detailsCard/PageCityCovid.dart';
import 'package:theodoisuckhoe_app/viewmodel/ViewModel.dart';

class ViewCovidPage extends StatefulWidget {
  var title;
  ViewCovidPage(this.title);

  @override
  _ViewCovidPageState createState() => _ViewCovidPageState();
}

class _ViewCovidPageState extends State<ViewCovidPage> {

  var url = "https://static.pipezero.com/covid/data.json";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
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
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                              onPressed: ()=>{ Navigator.pop(context)},
                              icon: Icon(Icons.arrow_back, size: 30, color: Colors.white,)
                          ),
                        ),
                        Center(
                          child: Text(widget.title, style: TextStyle(color: Colors.white, fontSize: 20),),
                        ),
                      ],
                    ),
                  ),
                  ViewModelProvider<HomeViewModel>.withConsumer(
                    viewModelBuilder: () => HomeViewModel(),
                    onModelReady: (model) async {
                      model.getCovidData(url);
                    },
                      builder: (context, model, child) =>
                      model.covids.length==0 ? Container(child: Center(child: Text("Loading", style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w500),)))
                    :Container(
                        margin: EdgeInsets.only(bottom: 20.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(topRight: Radius.circular(40), topLeft: Radius.circular(40))
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 100,
                              margin: EdgeInsets.only(top: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.45,
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:  BorderRadius.circular(20)
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          model.covids[0].name,
                                          style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.white),
                                        ),
                                        Text(
                                          '${model.covids[0].cases}',
                                          style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.45,
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius:  BorderRadius.circular(20)
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          model.covids[1].name,
                                          style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.white),
                                        ),
                                        Text(
                                          '${model.covids[1].cases}',
                                          style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20.0, left: 10, right: 10),
                              height: 50,
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  "Tình hình covid",
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
                                  textAlign: TextAlign.left,
                                ),

                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10, right: 10),
                              child: Column(
                                children: model.covids.map(
                                        (e) =>
                                            GestureDetector(
                                              onTap: (){
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                        PageCityCovid(e.name, '${e.death}', '${e.treating}', '${e.cases}', '${e.recovered}')
                                                    )
                                                );
                                              },
                                          child: Container(
                                              decoration: BoxDecoration(
                                                border: Border(
                                                  bottom: BorderSide(width: 5.0, color: Colors.lightBlue.shade900),
                                                )
                                              ),
                                              height: 60,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                      e.name,
                                                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                                                  ),
                                                  Text(
                                                      '${e.cases}',
                                                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.red)
                                                  )
                                                ],
                                              )
                                          ),
                                        )
                                ).toList(),
                              ),
                            )
                          ],
                        ),
                      )
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}
