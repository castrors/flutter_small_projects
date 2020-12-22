import 'package:flutter/material.dart';

class GoodCheapFastPage extends StatefulWidget {
  @override
  _GoodCheapFastPageState createState() => _GoodCheapFastPageState();
}

const String goodLabel = 'Good';
const String cheapLabel = 'Cheap';
const String fastLabel = 'Fast';

class _GoodCheapFastPageState extends State<GoodCheapFastPage> {
  var good = false;
  var cheap = false;
  var fast = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('How do you want your project to be?'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            key: Key('switch_good'),
            title: Text(goodLabel),
            value: good,
            onChanged: (value) {
              setState(() {
                good = value;
                _doTheTrick(goodLabel);
              });
            },
          ),
          SwitchListTile(
            key: Key('switch_cheap'),
            title: Text(cheapLabel),
            value: cheap,
            onChanged: (value) {
              setState(() {
                cheap = value;
                _doTheTrick(cheapLabel);
              });
            },
          ),
          SwitchListTile(
            key: Key('switch_fast'),
            title: Text(fastLabel),
            value: fast,
            onChanged: (value) {
              setState(() {
                fast = value;
                _doTheTrick(fastLabel);
              });
            },
          ),
        ],
      ),
    );
  }

  void _doTheTrick(String theClickedOne) {
    if (good && cheap && fast) {
      if (theClickedOne == goodLabel) {
        fast = false;
      }
      if (theClickedOne == cheapLabel) {
        good = false;
      }
      if (theClickedOne == fastLabel) {
        cheap = false;
      }
    }
  }
}
