// ignore_for_file: constant_identifier_names

import 'package:storage_info/storage_info_platform_interface.dart';

class StorageInfo {
  // Storage space in bytes
  Future<double> getStorageTotalSpace(
      [SpaceUnit unit = SpaceUnit.Bytes]) async {
    int bytes = await StorageInfoPlatform.instance.getStorageTotalSpace();
    return _getSpaceByUnit(bytes: bytes, unit: unit);
  }

  Future<double> getStorageFreeSpace([SpaceUnit unit = SpaceUnit.Bytes]) async {
    int bytes = await StorageInfoPlatform.instance.getStorageFreeSpace();
    return _getSpaceByUnit(bytes: bytes, unit: unit);
  }

  Future<double> getStorageUsedSpace([SpaceUnit unit = SpaceUnit.Bytes]) async {
    int bytes = await StorageInfoPlatform.instance.getStorageUsedSpace();
    return _getSpaceByUnit(bytes: bytes, unit: unit);
  }

  // External storage in bytes
  /// For android only
  Future<double> getExternalStorageTotalSpace(
      [SpaceUnit unit = SpaceUnit.Bytes]) async {
    int bytes =
        await StorageInfoPlatform.instance.getExternalStorageTotalSpace();
    return _getSpaceByUnit(bytes: bytes, unit: unit);
  }

  /// For android only
  Future<double> getExternalStorageFreeSpace(
      [SpaceUnit unit = SpaceUnit.Bytes]) async {
    int bytes =
        await StorageInfoPlatform.instance.getExternalStorageFreeSpace();
    return _getSpaceByUnit(bytes: bytes, unit: unit);
  }

  /// For android only
  Future<double> getExternalStorageUsedSpace(
      [SpaceUnit unit = SpaceUnit.Bytes]) async {
    int bytes =
        await StorageInfoPlatform.instance.getExternalStorageUsedSpace();
    return _getSpaceByUnit(bytes: bytes, unit: unit);
  }

  double _getSpaceByUnit({required int bytes, required SpaceUnit unit}) {
    double kb = bytes / 1024;
    double mb = kb / 1024;
    double gb = mb / 1024;

    switch (unit) {
      case SpaceUnit.Bytes:
        return bytes.toDouble();
      case SpaceUnit.KB:
        return kb;
      case SpaceUnit.MB:
        return mb;
      case SpaceUnit.GB:
        return gb;
      default:
        return bytes.toDouble();
    }
  }
}

enum SpaceUnit {
  Bytes,
  MB,
  KB,
  GB,
}
