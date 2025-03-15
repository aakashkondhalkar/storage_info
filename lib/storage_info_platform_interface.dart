import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'storage_info_method_channel.dart';

abstract class StorageInfoPlatform extends PlatformInterface {
  /// Constructs a StorageInfoPlatform.
  StorageInfoPlatform() : super(token: _token);

  static final Object _token = Object();

  static StorageInfoPlatform _instance = MethodChannelStorageInfo();

  /// The default instance of [StorageInfoPlatform] to use.
  ///
  /// Defaults to [MethodChannelStorageInfo].
  static StorageInfoPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [StorageInfoPlatform] when
  /// they register themselves.
  static set instance(StorageInfoPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  // Storage space in bytes
  Future<int> getStorageTotalSpace() {
    throw UnimplementedError(
        'getStorageTotalSpace() has not been implemented.');
  }

  Future<int> getStorageFreeSpace() {
    throw UnimplementedError('getStorageFreeSpace() has not been implemented.');
  }

  Future<int> getStorageUsedSpace() {
    throw UnimplementedError('getStorageUsedSpace() has not been implemented.');
  }

  // External storage in bytes
  Future<int> getExternalStorageTotalSpace() {
    throw UnimplementedError(
        'getExternalStorageTotalSpace() has not been implemented.');
  }

  Future<int> getExternalStorageFreeSpace() {
    throw UnimplementedError(
        'getExternalStorageFreeSpace() has not been implemented.');
  }

  Future<int> getExternalStorageUsedSpace() {
    throw UnimplementedError(
        'getExternalStorageUsedSpace() has not been implemented.');
  }
}
