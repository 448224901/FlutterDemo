import 'package:flutter/material.dart';

// RadioListTile的示范代码
class RadioListTileDemo extends StatefulWidget {
  @override
  _RadioListTileDemoState createState() => new _RadioListTileDemoState();
}

class _RadioListTileDemoState extends State<RadioListTileDemo> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          'ListView的RadioListTile的切换',
          style: new TextStyle(fontSize: 17.0),
        ),
      ),
      body: items(),
    );
  }

  // 示例来源于源码
  Widget items() {
    return new Column(
      // In the build function of that State
      children: <Widget>[
        new RadioListTile<SingingCharacter>(
          title: const Text('item title1'),
          value: SingingCharacter.title1,
          groupValue: _character,
          onChanged: (SingingCharacter value) {
            setState(() {
              _character = value;
              print('$value');
            });
          },
        ),
        new RadioListTile<SingingCharacter>(
          title: const Text('item title2'),
          value: SingingCharacter.title2,
          groupValue: _character,
          onChanged: (SingingCharacter value) {
            setState(() {
              _character = value;
              print('$value');
            });
          },
        ),
      ],
    );
  }
}

// In the State of a stateful widget:
SingingCharacter _character = SingingCharacter.title1;

enum SingingCharacter { title1, title2 }