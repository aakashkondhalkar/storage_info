import 'dart:async';

import 'package:flutter/services.dart';

class StorageInfo {
  static const MethodChannel _channel = const MethodChannel('storage_info');

  // Storage space in bytes
  static Future<int> get getStorageFreeSpace async {
    final int freeSpace = await _channel.invokeMethod('getStorageFreeSpace');
    return freeSpace;
  }

  static Future<int> get getStorageTotalSpace async {
    final int totalSpace = await _channel.invokeMethod('getStorageTotalSpace');
    return totalSpace;
  }

  static Future<int> get getStorageUsedSpace async {
    final int usedSpace = await _channel.invokeMethod('getStorageUsedSpace');
    return usedSpace;
  }

  // External storage in bytes
  static Future<int> get getExternalStorageTotalSpace async {
    final int totalSpace =
        await _channel.invokeMethod('getExternalStorageTotalSpace');
    return totalSpace;
  }

  static Future<int> get getExternalStorageFreeSpace async {
    final int freeSpace =
        await _channel.invokeMethod('getExternalStorageFreeSpace');
    return freeSpace;
  }

  static Future<int> get getExternalStorageUsedSpace async {
    final int usedSpace =
        await _channel.invokeMethod('getExternalStorageUsedSpace');
    return usedSpace;
  }

  // Storage space in MB
  static Future<double> get getStorageFreeSpaceInMB async {
    final double freeSpace =
        await _channel.invokeMethod('getStorageFreeSpaceInMB');
    return freeSpace;
  }

  static Future<double> get getStorageUsedSpaceInMB async {
    final double usedSpace =
        await _channel.invokeMethod('getStorageUsedSpaceInMB');
    return usedSpace;
  }

  static Future<double> get getStorageTotalSpaceInMB async {
    final double totalSpace =
        await _channel.invokeMethod('getStorageTotalSpaceInMB');
    return totalSpace;
  }

  // Storage space in GB
  static Future<double> get getStorageFreeSpaceInGB async {
    final double freeSpace =
        await _channel.invokeMethod('getStorageFreeSpaceInGB');
    return freeSpace;
  }

  static Future<double> get getStorageUsedSpaceInGB async {
    final double usedSpace =
        await _channel.invokeMethod('getStorageUsedSpaceInGB');
    return usedSpace;
  }

  static Future<double> get getStorageTotalSpaceInGB async {
    final double totalSpace =
        await _channel.invokeMethod('getStorageTotalSpaceInGB');
    return totalSpace;
  }

  // External storage space in MB
  static Future<double> get getExternalStorageFreeSpaceInMB async {
    final double freeSpace =
        await _channel.invokeMethod('getExternalStorageFreeSpaceInMB');
    return freeSpace;
  }

  static Future<double> get getExternalStorageUsedSpaceInMB async {
    final double usedSpace =
        await _channel.invokeMethod('getExternalStorageUsedSpaceInMB');
    return usedSpace;
  }

  static Future<double> get getExternalStorageTotalSpaceInMB async {
    final double totalSpace =
        await _channel.invokeMethod('getExternalStorageTotalSpaceInMB');
    return totalSpace;
  }

  // External storage space in GB
  static Future<double> get getExternalStorageFreeSpaceInGB async {
    final double freeSpace =
        await _channel.invokeMethod('getExternalStorageFreeSpaceInGB');
    return freeSpace;
  }

  static Future<double> get getExternalStorageUsedSpaceInGB async {
    final double usedSpace =
        await _channel.invokeMethod('getExternalStorageUsedSpaceInGB');
    return usedSpace;
  }

  static Future<double> get getExternalStorageTotalSpaceInGB async {
    final double totalSpace =
        await _channel.invokeMethod('getExternalStorageTotalSpaceInGB');
    return totalSpace;
  }
}
