import 'dart:developer';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _appBarButtonActive = false;
  int _counter = 0;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Click the FAB'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.thumb_up),
              color: _appBarButtonActive ? Colors.red : Colors.white,
              onPressed: () {
                _appBarButtonActive = !_appBarButtonActive;
                setState(() {});
              })
        ],
      ),
      body: Center(
        child: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Clicks: $_counter"),
              ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_circle),
          onPressed: () {
            _counter++;
            if (_counter % 2 == 0) {
              scaffoldKey.currentState.hideCurrentSnackBar();
              scaffoldKey.currentState.showSnackBar(
                SnackBar(
                  content: Text(
                    "Snackbar Simple",
                  ),
                ),
              );
            } else {
              scaffoldKey.currentState.hideCurrentSnackBar();
              scaffoldKey.currentState.showSnackBar(
                SnackBar(
                  content: Text(
                    "Snackbar con acción",
                  ),
                  action: SnackBarAction(
                    label: 'OK!',
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            String fecha = DateTime.now().toString();
                            return AlertDialog(
                              title: Text("Titulo"),
                              content: Text(fecha),
                              actions: <Widget>[
                                FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Cerrar"),
                                )
                              ],
                            );
                          });
                    },
                  ),
                ),
              );
            }
            setState(() {});
          }),
    );
  }
}
