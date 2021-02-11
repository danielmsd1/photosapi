import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" show get;
import 'package:photosapi/models/getJson.dart';
import 'package:photosapi/widgets/imageList.dart';

void main() {
  runApp(Counter());
}

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;
  List<ParseImage> images = [];

  void _fetchData() async {
    _counter++;
    var response =
        await get('https://jsonplaceholder.typicode.com/photos/$_counter');
    var parseImage = ParseImage.fromJson(json.decode(response.body));

    setState(() {
      images.add(parseImage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Images'),
        ),
        body: Center(
          child: ImageList(images),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: _fetchData,
        ),
      ),
    );
  }
}
