import 'package:flutter/material.dart';
import 'dart:async';
import 'package:storage_info/storage_info.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<int> _getSpace() async {
    return await StorageInfo.getStorageTotalSpace;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: FutureBuilder(
            future: _getSpace(),
            builder: (context, snapshot) {
              print(snapshot.error);
              if (snapshot.hasData) {
                return Center(
                  child: Text('Space: ${snapshot.data}'),
                );
              } else {
                return Center(child: Text("Loading"));
              }
            }),
      ),
    );
  }
}
