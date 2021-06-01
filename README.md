# storage_info

Get the information about free, Used and total disk space for you device Internal Storage as well as External Storage (SD card).

To use this plugin, add storage_info as a dependency in your pubspec.yaml file.

### Example

```dart
// Import package
import 'package:storage_info/storage_info.dart';

// Access internal storage space
Future<int> _getSpace() async {
  return await StorageInfo.getStorageFreeSpace;
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

This package provides properties to get internal storage in bytes, MB and GB
So you dont need to convert bytes in MB or GB

See below code

// For internal storage

```dart

// get internal storage total space in bytes, MB and GB
await StorageInfo.getStorageTotalSpace; // return int
await StorageInfo.getStorageTotalSpaceInMB; // return double
await StorageInfo.getStorageTotalSpaceInGB; // return double

// get internal storage free space in bytes, MB and GB
await StorageInfo.getStorageFreeSpace; // return int
await StorageInfo.getStorageFreeSpaceInMB; // return double
await StorageInfo.getStorageFreeSpaceInGB; // return double

// get internal storage used space in bytes, MB and GB
await StorageInfo.getStorageUsedSpace; // return int
await StorageInfo.getStorageUsedSpaceInMB; // return double
await StorageInfo.getStorageUsedSpaceInGB; // return double

```

// For external storage (SD card)

```dart

// get external storage total space in bytes, MB and GB
return await StorageInfo.getExternalStorageTotalSpace; // return int
return await StorageInfo.getExternalStorageTotalSpaceInMB; // return double
return await StorageInfo.getExternalStorageTotalSpaceInGB; // return double

// get external storage free space in bytes, MB and GB
return await StorageInfo.getExternalStorageFreeSpace; // return int
return await StorageInfo.getExternalStorageFreeSpaceInMB; // return double
return await StorageInfo.getExternalStorageFreeSpaceInGB; // return double

// get external storage used space in bytes, MB and GB
return await StorageInfo.getExternalStorageUsedSpace; // return int
return await StorageInfo.getExternalStorageUsedSpaceInMB; // return double
return await StorageInfo.getExternalStorageUsedSpaceInGB; // return double


```
