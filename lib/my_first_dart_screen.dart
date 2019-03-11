import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyFirstDartScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyFirstDartScreenState();
  }
}

class MyFirstDartScreenState extends State<MyFirstDartScreen>
    with TickerProviderStateMixin {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  AnimationController _controller;
  CurvedAnimation _curve;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    _curve = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('My App Bar'),
        elevation: 16.0,
        backgroundColor: Colors.amber,
      ),
      body: _buildGridView(),
    );
  }

  Widget _gridItem(int i) {
    return GridTile(
      child: Container(
        child: FadeTransition(
            opacity: _curve,
            child: new InkResponse(
              child: Text('$i'),
              onTap: () => showToast(i),
            )),
      ),
    );
  }

  Widget _buildGridView() {
    return GridView.builder(
      itemBuilder: (context, i) {
        return _gridItem(i);
      },
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 10),
      itemCount: 100,
      padding: EdgeInsets.all(8.0),
      reverse: false,
      scrollDirection: Axis.horizontal,
    );
  }

  void showToast(int i) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text("$i"),
    ));
    _controller.forward();
    Navigator.of(context).pushNamed("/b");
  }
}
