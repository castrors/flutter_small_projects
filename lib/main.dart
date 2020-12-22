import 'package:flutter/material.dart';

import 'good_cheap_fast/good_cheap_fast_page.dart';

void main() {
  runApp(SmallProjectsApp());
}

class SmallProjectsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Small Projects',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Small Projects'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            _createCard(context, 'Good - Cheap - Fast', GoodCheapFastPage())
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _createCard(BuildContext context, String title, Widget widget) {
    return Card(
      child: ListTile(
          title: Text(title),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => widget));
          }),
    );
  }
}
