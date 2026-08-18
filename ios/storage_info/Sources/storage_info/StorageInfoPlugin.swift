import Flutter
import UIKit

public class StorageInfoPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "storage_info", binaryMessenger: registrar.messenger())
        let instance = StorageInfoPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "getStorageFreeSpace":
            result(getStorageFreeSpace())
        case "getStorageUsedSpace":
            result(getStorageUsedSpace())
        case "getStorageTotalSpace":
            result(getStorageTotalSpace())
        default:
            result(FlutterMethodNotImplemented)
        }
    }
    
    // Get total storage space
    private func getStorageTotalSpace() -> Int64 {
        let fileSystemAttributes = try? FileManager.default.attributesOfFileSystem(forPath: NSHomeDirectory())
        let totalSpace = fileSystemAttributes?[FileAttributeKey.systemSize] as? Int64
        return totalSpace ?? 0
    }
    
    // Get free storage space
    private func getStorageFreeSpace() -> Int64 {
        let fileSystemAttributes = try? FileManager.default.attributesOfFileSystem(forPath: NSHomeDirectory())
        let freeSpace = fileSystemAttributes?[FileAttributeKey.systemFreeSize] as? Int64
        return freeSpace ?? 0
    }
    
    // Get used storage space
    private func getStorageUsedSpace() -> Int64 {
        let totalSpace = getStorageTotalSpace()
        let freeSpace = getStorageFreeSpace()
        return totalSpace - freeSpace
    }
}
