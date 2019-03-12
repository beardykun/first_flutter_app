import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MySecondDartScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MySecondDartScreenState();
  }
}

class MySecondDartScreenState extends State<MySecondDartScreen> {
  List _widgets = [];

  @override
  void initState() {
    super.initState();

    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SecondPage")),
      body: ListView.builder(itemCount: _widgets.length,
      itemBuilder: (BuildContext context, int position){
        return getRow(position);
      },),
    );
  }

  Widget getRow(int position){
  return Padding(padding: EdgeInsets.all(10.0),
  child: Text("Row ${_widgets[position]["title"]}"),);
  }

  loadData() async{
    String dataUrl = "https://jsonplaceholder.typicode.com/posts";
    http.Response response = await http.get(dataUrl);
    setState(() {
      _widgets = json.decode(response.body);
    });
  }
}
