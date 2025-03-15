# storage_info

Get the information about free, Used and total disk space for you device Internal Storage as well as External Storage (SD card).

To use this plugin, add storage_info as a dependency in your pubspec.yaml file.

### Example

```dart
// Import package
import 'package:storage_info/storage_info.dart';

//Initialize 
final _storageInfoPlugin = StorageInfo();

// Access internal storage space
Future<int> _getSpace() async {
  return await _storageInfoPlugin.getStorageFreeSpace();
}

// Inside build method use future builder
FutureBuilder(
        future: _getSpace(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Text('Space: ${snapshot.data}'),
            );
          } else {
            return Center(child: Text("Loading"));
          }
   }),
}
```

This package provides properties to get internal storage in bytes, KB, MB and GB
So you don't need to convert bytes in KB, MB or GB.

- **Note:** If your are migrating from `0.0.1` to `1.0.0` please read the [Changelog](https://pub.dev/packages/storage_info/changelog#100)
  for changes.

See below code

- For internal storage

```dart

final _storageInfoPlugin = StorageInfo();

// get internal storage total space in Bytes, KB, MB and GB
await _storageInfoPlugin.getStorageTotalSpace(); // default to bytes
await _storageInfoPlugin.getStorageTotalSpace(SpaceUnit.KB);
await _storageInfoPlugin.getStorageTotalSpace(SpaceUnit.MB);
await _storageInfoPlugin.getStorageTotalSpace(SpaceUnit.GB);

// get internal storage free space in Bytes, KB, MB and GB
await _storageInfoPlugin.getStorageFreeSpace(); // default to bytes
await _storageInfoPlugin.getStorageFreeSpace(SpaceUnit.KB);
await _storageInfoPlugin.getStorageFreeSpace(SpaceUnit.MB);
await _storageInfoPlugin.getStorageFreeSpace(SpaceUnit.GB);

// get internal storage used space in Bytes, KB, MB and GB
await _storageInfoPlugin.getStorageUsedSpace(); // default to bytes
await _storageInfoPlugin.getStorageUsedSpace(SpaceUnit.KB);
await _storageInfoPlugin.getStorageUsedSpace(SpaceUnit.MB);
await _storageInfoPlugin.getStorageUsedSpace(SpaceUnit.GB);

```

- For external storage (SD card) - *Only For Android*

```dart

final _storageInfoPlugin = StorageInfo();

// get external storage total space in Bytes, KB, MB and GB
await _storageInfoPlugin.getExternalStorageTotalSpace(); // default to bytes
await _storageInfoPlugin.getExternalStorageTotalSpace(SpaceUnit.KB);
await _storageInfoPlugin.getExternalStorageTotalSpace(SpaceUnit.MB);
await _storageInfoPlugin.getExternalStorageTotalSpace(SpaceUnit.GB);

// get external storage free space in Bytes, KB, MB and GB
await _storageInfoPlugin.getExternalStorageFreeSpace(); // default to bytes
await _storageInfoPlugin.getExternalStorageFreeSpace(SpaceUnit.KB);
await _storageInfoPlugin.getExternalStorageFreeSpace(SpaceUnit.MB);
await _storageInfoPlugin.getExternalStorageFreeSpace(SpaceUnit.GB);

// get external storage used space in Bytes, KB, MB and GB
await _storageInfoPlugin.getExternalStorageUsedSpace(); // default to bytes
await _storageInfoPlugin.getExternalStorageUsedSpace(SpaceUnit.KB);
await _storageInfoPlugin.getExternalStorageUsedSpace(SpaceUnit.MB);
await _storageInfoPlugin.getExternalStorageUsedSpace(SpaceUnit.GB);

```
