import 'package:flutter/material.dart';

class CovidModel{
  var name;
  int death;
  int treating;
  int cases;
  int recovered;

  CovidModel(@required this.name, @required this.death, @required this.treating,@required this.cases, @required this.recovered);
}