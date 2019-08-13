import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool opened = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            left: opened
                ? MediaQuery.of(context).size.width / 2 - 40.0
                : MediaQuery.of(context).size.width / 2 - 150.0,
            top: (MediaQuery.of(context).size.height / 2) - 30.0,
            child: _buildOption(
                Icon(FontAwesome.getIconData('glass'), color: Colors.white),
                Colors.purple)),
        AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            left: opened
                ? MediaQuery.of(context).size.width / 2 - 40.0
                : (MediaQuery.of(context).size.width / 2) - 120.0,
            top: opened ? (MediaQuery.of(context).size.height / 2) - 40.0
                : (MediaQuery.of(context).size.height / 2) - 110.0
            ,
            child: _buildOption(Icon(FontAwesome.getIconData('glass'), color: Colors.white), Colors.purple)),
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            left: opened
                ? MediaQuery.of(context).size.width / 2 - 40.0
                : (MediaQuery.of(context).size.width / 2) + 80.0,
            top: (MediaQuery.of(context).size.height / 2) - 30.0,
            child: _buildOption(Icon(FontAwesome.getIconData('bicycle'), color: Colors.white), Colors.green)),
            AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            left: opened
                ? MediaQuery.of(context).size.width / 2 - 40.0
                : (MediaQuery.of(context).size.width / 2) + 50.0,
            top: opened ? (MediaQuery.of(context).size.height / 2) - 40.0:
                          (MediaQuery.of(context).size.height / 2) - 110.0
            ,
            child: _buildOption(Icon(FontAwesome.getIconData('bicycle'), color: Colors.white), Colors.green)),
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            left: MediaQuery.of(context).size.width / 2 - 35.0,
            top: opened
                ? (MediaQuery.of(context).size.height / 2) - 40.0
                : (MediaQuery.of(context).size.height / 2) - 150.0,
            child: _buildOption(Icon(FontAwesome.getIconData('glass'), color: Colors.white), Colors.brown)),
          AnimatedPositioned(
              duration: Duration(milliseconds: 300),
              left: MediaQuery.of(context).size.width / 2 - 35.0,
              top: opened
                  ? (MediaQuery.of(context).size.height / 2) - 40.0
                  : (MediaQuery.of(context).size.height / 2) + 80.0,
              child: _buildOption(Icon(FontAwesome.getIconData('beer'), color: Colors.white), Colors.deepOrange)),
          AnimatedPositioned(
              duration: Duration(milliseconds: 300),
              left: opened ?MediaQuery.of(context).size.width / 2 - 40.0 :
                            MediaQuery.of(context).size.width / 2 - 110.0
              ,
              top: opened
                  ? (MediaQuery.of(context).size.height / 2) - 40.0
                  : (MediaQuery.of(context).size.height / 2) + 50.0,
              child: _buildOption(Icon(FontAwesome.getIconData('beer'), color: Colors.white), Colors.deepOrange)),
          AnimatedPositioned(
              duration: Duration(milliseconds: 300),
              left: opened ?MediaQuery.of(context).size.width / 2 - 40.0 :
                            MediaQuery.of(context).size.width / 2 + 50.0
              ,
              top: opened
                  ? (MediaQuery.of(context).size.height / 2) - 40.0
                  : (MediaQuery.of(context).size.height / 2) + 50.0,
              child: _buildOption(Icon(FontAwesome.getIconData('beer'), color: Colors.white), Colors.deepOrange)),
        Align(
          alignment: Alignment.center,
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 200),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return ScaleTransition(child: child, scale: animation);
            },
            child: opened
                ? InkWell(
                    key: UniqueKey(),
                    child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                            height: 80.0,
                            width: 80.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40.0),
                                color: Colors.blue),
                            child: Center(
                                child: Icon(Icons.home, color: Colors.white)))),
                    onTap: () {
                      setState(() {
                        opened = false;
                      });
                    })
                : InkWell(
                    key: UniqueKey(),
                    child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                            height: 80.0,
                            width: 80.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40.0),
                                color: Colors.red),
                            child: Center(
                                child:
                                    Icon(Icons.close, color: Colors.white)))),
                    onTap: () {
                      setState(() {
                        opened = true;
                      });
                    }),
          ),
        )
      ],
    ));
  }

  Widget _buildOption(Icon icon, Color iconColor) {
    return AnimatedSwitcher(
        duration: Duration(milliseconds: 500),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return RotationTransition(child: child, turns: animation);
        },
        child: InkWell(
          key: UniqueKey(),
          child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: iconColor),
                  child: Center(child: icon))),
          onTap: () {
            setState(() {
              opened = false;
            });
          },
        ));
  }
}
