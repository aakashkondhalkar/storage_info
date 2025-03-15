import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:storage_info/storage_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _totalSpace = 0;
  double _freeSpace = 0;
  double _usedSpace = 0;
  final _storageInfoPlugin = StorageInfo();

  @override
  void initState() {
    super.initState();
    initStorage();
  }

  Future<void> initStorage() async {
    try {
      _totalSpace = await _storageInfoPlugin.getStorageTotalSpace(SpaceUnit.GB);
      _freeSpace = await _storageInfoPlugin.getStorageFreeSpace(SpaceUnit.GB);
      _usedSpace = await _storageInfoPlugin.getStorageUsedSpace(SpaceUnit.GB);

      if (!mounted) return;
      setState(() {});
    } on PlatformException {
      debugPrint("Error occurred");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              Text('Total space: $_totalSpace'),
              const SizedBox(height: 8),
              Text('Free space: $_freeSpace'),
              const SizedBox(height: 8),
              Text('Used space: $_usedSpace'),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
