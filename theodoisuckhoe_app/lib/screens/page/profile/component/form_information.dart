import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class Dmc extends StatefulWidget {
  @override
  _DmcState createState() => _DmcState();
}

class _DmcState extends State<Dmc> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: <Widget>[
                  TextFormField(
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter some text Password should contain more than 5 characters&& ";
                      }
                      return (value != null && value.contains('@'))
                          ? 'Do not use the @ char.'
                          : null;
                    },
                    decoration: InputDecoration(
                        errorMaxLines: 3,
                        labelText: "Họ tên",
                        labelStyle:
                            TextStyle(color: Colors.black, fontSize: 15)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
              child: Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: <Widget>[
                  TextFormField(
                    validator: (value) {
                      RegExp regExp = new RegExp(
                        r"^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$",
                        caseSensitive: true,
                        multiLine: false,
                      );
                      int ageCalculate(String input) {
                        if (regExp.hasMatch(input)) {
                          DateTime _dateTime = DateTime(
                            int.parse(input.substring(6)),
                            int.parse(input.substring(3, 5)),
                            int.parse(input.substring(0, 2)),
                          );
                          return DateTime.fromMillisecondsSinceEpoch(
                                      DateTime.now()
                                          .difference(_dateTime)
                                          .inMilliseconds)
                                  .year -
                              1970;
                        } else {
                          return -1;
                        }
                      }
                    },
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.calendar_today_outlined,
                          color: Colors.black,
                        ),
                        labelText: "Ngày Sinh",
                        labelStyle:
                            TextStyle(color: Colors.black, fontSize: 15)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: <Widget>[
                  TextFormField(
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter some text Password should contain more than 5 characters&& ";
                      }
                      return (value != null && value.contains('@'))
                          ? 'Do not use the @ char.'
                          : null;
                    },
                    decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.phone_android_outlined,
                          color: Colors.black,
                        ),
                        errorMaxLines: 3,
                        labelText: "Số điện thoại",
                        labelStyle:
                            TextStyle(color: Colors.black, fontSize: 15)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: <Widget>[
                  TextFormField(
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter some text Password should contain more than 5 characters&& ";
                      }
                      return (value != null && value.contains('@'))
                          ? 'Do not use the @ char.'
                          : null;
                    },
                    decoration: InputDecoration(
                        errorMaxLines: 3,
                        labelText: "Số hộ chiếu CMND/CCCD*",
                        labelStyle:
                            TextStyle(color: Colors.black, fontSize: 15)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: <Widget>[
                  TextFormField(
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter some text Password should contain more than 5 characters&& ";
                      }
                      return (value != null && value.contains('@'))
                          ? 'Do not use the @ char.'
                          : null;
                    },
                    decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.email_outlined,
                          color: Colors.black,
                        ),
                        errorMaxLines: 3,
                        labelText: "email",
                        labelStyle:
                            TextStyle(color: Colors.black, fontSize: 15)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: <Widget>[
                  TextFormField(
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter some text Password should contain more than 5 characters&& ";
                      }
                      return (value != null && value.contains('@'))
                          ? 'Do not use the @ char.'
                          : null;
                    },
                    decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.add_location,
                          color: Colors.black,
                        ),
                        errorMaxLines: 3,
                        labelText: "Địa chỉ",
                        labelStyle:
                            TextStyle(color: Colors.black, fontSize: 15)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            GFButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              text: "Lưu thông tin",
              blockButton: true,
              size: GFSize.LARGE,
              textColor: Colors.white,
              shape: GFButtonShape.pills,
            ),
          ],
        ),
      ),
    );
  }
}
