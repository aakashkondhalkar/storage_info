package com.pinciat.storage_info

import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import android.os.Environment
import android.os.StatFs
import android.util.Log
import androidx.annotation.RequiresApi
import android.os.Build
import android.content.Context
import java.io.File
import androidx.core.content.ContextCompat.*
import java.io.IOException
/** StorageInfoPlugin */
class StorageInfoPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private lateinit var context: Context

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    context = flutterPluginBinding.applicationContext
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "storage_info")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    when(call.method) {
      "getStorageFreeSpace" -> result.success(getStorageFreeSpace())
      "getStorageUsedSpace" -> result.success(getStorageUsedSpace())
      "getStorageTotalSpace" -> result.success(getStorageTotalSpace())

      "getExternalStorageTotalSpace" -> result.success(getExternalStorageTotalSpace())
      "getExternalStorageFreeSpace" -> result.success(getExternalStorageFreeSpace())
      "getExternalStorageUsedSpace" -> result.success(getExternalStorageUsedSpace())

      else -> result.notImplemented()
    }
  }

  @RequiresApi(Build.VERSION_CODES.JELLY_BEAN_MR2)
  fun getStorageTotalSpace(): Long {
    return try {
      val path = Environment.getDataDirectory()
      val stat = StatFs(path.path)
      if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
        stat.blockSizeLong * stat.blockCountLong
      } else {
        stat.totalBytes
      }
    } catch (e: Exception) {
      Log.e("StorageInfoPlugin", "Error getting total storage space: ${e.message}")
      -1L // Error code
    }
  }

  @RequiresApi(Build.VERSION_CODES.JELLY_BEAN_MR2)
  fun getStorageFreeSpace(): Long {
    return try {
      val path = Environment.getDataDirectory()
      val stat = StatFs(path.path)
      if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
        stat.blockSizeLong * stat.availableBlocksLong
      } else {
        stat.availableBytes
      }
    } catch (e: Exception) {
      Log.e("StorageInfoPlugin", "Error getting free storage space: ${e.message}")
      -1L // Error code
    }
  }

  @RequiresApi(Build.VERSION_CODES.JELLY_BEAN_MR2)
  fun getStorageUsedSpace(): Long {
    return try {
      val usedSpace = getStorageTotalSpace() - getStorageFreeSpace()
      if (usedSpace < 0) {
        Log.e("StorageInfoPlugin", "Used space calculation error")
      }
      usedSpace
    } catch (e: Exception) {
      Log.e("StorageInfoPlugin", "Error calculating used space: ${e.message}")
      -1L // Error code
    }
  }

  @RequiresApi(Build.VERSION_CODES.JELLY_BEAN_MR2)
  fun getExternalStorageTotalSpace(): Long {
    return try {
      val dirs: Array<File> = getExternalFilesDirs(context, null)
      val path = dirs[1].path // External storage directory
      val stat = StatFs(path.split("Android")[0])
      if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
        stat.blockSizeLong * stat.blockCountLong
      } else {
        stat.totalBytes
      }
    } catch (e: Exception) {
      Log.e("StorageInfoPlugin", "Error getting external total storage space: ${e.message}")
      0
    }
  }

  @RequiresApi(Build.VERSION_CODES.JELLY_BEAN_MR2)
  fun getExternalStorageFreeSpace(): Long {
    return try {
      val dirs: Array<File> = getExternalFilesDirs(context, null)
      val path = dirs[1].path // External storage directory
      val stat = StatFs(path.split("Android")[0])
      if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
        stat.blockSizeLong * stat.availableBlocksLong
      } else {
        stat.availableBytes
      }
    } catch (e: Exception) {
      Log.e("StorageInfoPlugin", "Error getting external free storage space: ${e.message}")
      0
    }
  }

  @RequiresApi(Build.VERSION_CODES.JELLY_BEAN_MR2)
  fun getExternalStorageUsedSpace(): Long {
    return try {
      val usedSpace = getExternalStorageTotalSpace() - getExternalStorageFreeSpace()
      if (usedSpace < 0) {
        Log.e("StorageInfoPlugin", "External used space calculation error")
      }
      usedSpace
    } catch (e: Exception) {
      Log.e("StorageInfoPlugin", "Error calculating external used space: ${e.message}")
      0
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
