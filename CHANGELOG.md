## 2.0.0

- Bump Dart version to 3.12 & minimum Flutter version to 3.44.0.
- ADDED: Swift Package Manager (SPM) support for iOS.
- ADDED: support for the iOS UIScene lifecycle.
- FIXED: Android - migrate plugin to built-in Kotlin for AGP 9.0 compatibility.

## 1.0.0

- Added iOS support.
- **Breaking change**
  Following methods are removed:
  `getStorageFreeSpaceInMB`, `getStorageUsedSpaceInMB`, `getStorageTotalSpaceInMB`, `getStorageFreeSpaceInGB`, `getStorageUsedSpaceInGB`, `getStorageTotalSpaceInGB`,`getExternalStorageFreeSpaceInMB`, `getExternalStorageUsedSpaceInMB`, `getExternalStorageTotalSpaceInMB`,`getExternalStorageFreeSpaceInGB`, `getExternalStorageUsedSpaceInGB`, `getExternalStorageTotalSpaceInGB`

  Now, simply use the `SpaceUnit` enum to obtain the space in `KB`, `MB`, or `GB`, as shown in the [Example](https://pub.dev/packages/storage_info/example).
- Removed Android deprecated `registerWith(registrar: Registrar)` function
- Updated Android compile SDK to *34*
- Updated kotlin version to *1.7.10*
- Set minimum dart SDK to *3.4.0*

## 0.0.1

- This is initial release with newest Flutter SDk and null safety.
