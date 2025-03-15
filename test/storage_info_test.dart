import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:storage_info/storage_info_method_channel.dart';
import 'package:storage_info/storage_info_platform_interface.dart';

class MockStorageInfoPlatform
    with MockPlatformInterfaceMixin
    implements StorageInfoPlatform {
  @override
  Future<int> getExternalStorageFreeSpace() {
    // TODO: implement getExternalStorageFreeSpace
    throw UnimplementedError();
  }

  @override
  Future<int> getExternalStorageTotalSpace() {
    // TODO: implement getExternalStorageTotalSpace
    throw UnimplementedError();
  }

  @override
  Future<int> getExternalStorageUsedSpace() {
    // TODO: implement getExternalStorageUsedSpace
    throw UnimplementedError();
  }

  @override
  Future<int> getStorageFreeSpace() {
    // TODO: implement getStorageFreeSpace
    throw UnimplementedError();
  }

  @override
  Future<int> getStorageTotalSpace() {
    // TODO: implement getStorageTotalSpace
    throw UnimplementedError();
  }

  @override
  Future<int> getStorageUsedSpace() {
    // TODO: implement getStorageUsedSpace
    throw UnimplementedError();
  }
}

void main() {
  final StorageInfoPlatform initialPlatform = StorageInfoPlatform.instance;

  test('$MethodChannelStorageInfo is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelStorageInfo>());
  });
}
