import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:theodoisuckhoe_app/model/CovidModel.dart';
import 'package:theodoisuckhoe_app/model/News.dart';


class HomeViewModel extends ChangeNotifier{
  List<NewsItem> newsItems = [];
  List<CovidModel> covids = [];

  getNewsData(url) async  {

    var response = await http.get(Uri.parse(url));
    List<NewsItem> _newsItems = [];
    if(response.statusCode == 200){
      List m = jsonDecode(response.body)['data']['items'];
      for(var i in m){
        if(i['title'] != null){
          NewsItem newsItem = new NewsItem(i['id'], i['title'],i['thumb'], i['url']);
          _newsItems.add(newsItem);
        }
      }
    }else{
      _newsItems = [];
    }
    newsItems = _newsItems;
    notifyListeners();
  }


  getCovidData(url) async  {
    var response = await http.get(Uri.parse(url));

    List<CovidModel> _covidItems = [];

    if(response.statusCode == 200){
      var total = jsonDecode(response.body)['total'];
      if(total['internal'] != null){
        CovidModel _newCovidModel = new CovidModel(
            "Việt Nam",
            total['internal']['death'],
            total['internal']['treating'],
            total['internal']['cases'],
            total['internal']['recovered']
        );
        _covidItems.add(_newCovidModel);
      }

      if(total['world'] != null){
        CovidModel _newCovidModel = new CovidModel(
            "Thế giới",
            total['world']['death'],
            total['world']['treating'],
            total['world']['cases'],
            total['world']['recovered']
        );
        _covidItems.add(_newCovidModel);
      }

      var overview = jsonDecode(response.body)['locations'];

      for(var i in overview){
        CovidModel _newCovidModel = new CovidModel(
            i['name'],
            i['death'],
            i['treating'],
            i['cases'],
            i['recovered']
        );
        _covidItems.add(_newCovidModel);
      }

    }else{
      _covidItems = [];
    }

    covids = _covidItems;
    print(covids.length);

    notifyListeners();

  }


}