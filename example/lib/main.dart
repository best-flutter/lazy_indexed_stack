import 'package:flutter/material.dart';

import 'package:lazy_indexed_stack/lazy_indexed_stack.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {

  bool loading = true;

  @override
  void initState() {
    Future.delayed(new Duration(seconds: 2)).then((e){
      setState(() {
        loading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return loading?new Container(child: new Text("loading...."),):
    Container(child: new Text("load success"),);
  }
}


class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int index = 0;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body:new LazyIndexedStack(
        reuse: false,
        index: index,
        itemBuilder: (c,i){
          return LoadingPage();
        },
        itemCount: 4,

      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: [
        new BottomNavigationBarItem(icon: new Icon(Icons.add,color: Colors.black38,),title: new Text("add")),
        new BottomNavigationBarItem(icon: new Icon(Icons.add,color: Colors.black38),title: new Text("add")),
        new BottomNavigationBarItem(icon: new Icon(Icons.add,color: Colors.black38),title: new Text("add")),
        new BottomNavigationBarItem(icon: new Icon(Icons.add,color: Colors.black38),title: new Text("add")),
      ],currentIndex: index,onTap: (i){
        setState(() {
          index = i;
        });
      },),
    );
  }
}
