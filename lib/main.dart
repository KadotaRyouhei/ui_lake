import 'package:flutter/material.dart';
import './views/firstPage.dart';
import './views/secondPage.dart';
import './views/thirdPage.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Startup Name Generator',
      theme: new ThemeData(
        primaryColor: Colors.white,
      ),
      home: MyHomePage(),
    );
  }
//  Widget build(BuildContext context) {
//    final wordPair = new WordPair.random();
//    return new MaterialApp(
//      title: 'Welcome to Flutter',
//      home: new Scaffold(
//        appBar: new AppBar(
//          title: new Text('Welcome to Flutter'),
//        ),
//        body: new Center(
//          //child: new Text('Hello World'),
//          child:new RandomWords(),
//        ),
//      ),
//    );
//  }
}

class MyHomePage extends StatefulWidget {
    @override
    _MyHomePageState createState() => new _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    controller = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new TabBarView(
        controller: controller,
          children: <Widget>[
            new FirstPage(),
            new SecondPage(),
            new ThirdPage()
          ]
      ),
      bottomNavigationBar: new Material(
        color: Colors.orangeAccent,
        child:new TabBar(
          controller: controller,
            tabs: <Tab>[
              new Tab(text: "列表",icon: new Icon(Icons.home)),
              new Tab(text: "通知",icon: new Icon(Icons.message)),
              new Tab(text: "我的",icon: new Icon(Icons.cloud)),
            ]
        )
      ),
    );
  }
}