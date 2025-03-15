import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'storage_info_platform_interface.dart';

/// An implementation of [StorageInfoPlatform] that uses method channels.
class MethodChannelStorageInfo extends StorageInfoPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('storage_info');

  @override
  Future<int> getStorageTotalSpace() async {
    final int totalSpace =
        await methodChannel.invokeMethod('getStorageTotalSpace');

    return totalSpace;
  }

  @override
  Future<int> getStorageFreeSpace() async {
    final int freeSpace =
        await methodChannel.invokeMethod('getStorageFreeSpace');
    return freeSpace;
  }

  @override
  Future<int> getStorageUsedSpace() async {
    final int usedSpace =
        await methodChannel.invokeMethod('getStorageUsedSpace');
    return usedSpace;
  }

  // External storage in bytes
  @override
  Future<int> getExternalStorageTotalSpace() async {
    final int totalSpace =
        await methodChannel.invokeMethod('getExternalStorageTotalSpace');
    return totalSpace;
  }

  @override
  Future<int> getExternalStorageFreeSpace() async {
    final int freeSpace =
        await methodChannel.invokeMethod('getExternalStorageFreeSpace');
    return freeSpace;
  }

  @override
  Future<int> getExternalStorageUsedSpace() async {
    final int usedSpace =
        await methodChannel.invokeMethod('getExternalStorageUsedSpace');
    return usedSpace;
  }
}
