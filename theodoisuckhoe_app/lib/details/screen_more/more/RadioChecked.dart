import 'package:flutter/material.dart';

class RadioChecked extends StatefulWidget {
  RadioChecked(){}

  @override
  _RadioCheckedState createState() => _RadioCheckedState();
}
enum SingingCharacter { yes, no }

class _RadioCheckedState extends State<RadioChecked> {
  SingingCharacter? _character = SingingCharacter.yes;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: const Text('Có', style: TextStyle(fontSize: 14),),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.yes,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Không', style: TextStyle(fontSize: 14),),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.no,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
