package com.pinciat.storage_info

import androidx.annotation.NonNull

import android.os.Build
import android.os.Environment
import android.os.StatFs
import android.util.Log
import androidx.annotation.RequiresApi
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import androidx.core.content.ContextCompat.*
import android.content.Context         
import java.io.File
import io.flutter.plugin.common.PluginRegistry.Registrar

/** StorageInfoPlugin */
class StorageInfoPlugin: FlutterPlugin, MethodCallHandler  {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private lateinit var context: Context

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    context = flutterPluginBinding.applicationContext
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "storage_info")
    channel.setMethodCallHandler(this)
  }

  companion object {
  @JvmStatic
  fun registerWith(registrar: Registrar) {
    val channel = MethodChannel(registrar.messenger(), "storage_info")
    channel.setMethodCallHandler(StorageInfoPlugin())
    }
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
      when(call.method) {
          "getStorageFreeSpace" -> result.success(getStorageFreeSpace())
          "getStorageUsedSpace" -> result.success(getStorageUsedSpace())
          "getStorageTotalSpace" -> result.success(getStorageTotalSpace())

          "getExternalStorageTotalSpace" -> result.success(getExternalStorageTotalSpace())
          "getExternalStorageFreeSpace" -> result.success(getExternalStorageFreeSpace())
          "getExternalStorageUsedSpace" -> result.success(getExternalStorageUsedSpace())

          "getStorageFreeSpaceInMB" -> result.success(getStorageFreeSpaceInMB())
          "getStorageUsedSpaceInMB" -> result.success(getStorageUsedSpaceInMB())
          "getStorageTotalSpaceInMB" -> result.success(getStorageTotalSpaceInMB())

          "getStorageFreeSpaceInGB" -> result.success(getStorageFreeSpaceInGB())
          "getStorageUsedSpaceInGB" -> result.success(getStorageUsedSpaceInGB())
          "getStorageTotalSpaceInGB" -> result.success(getStorageTotalSpaceInGB())

          "getExternalStorageTotalSpaceInMB" -> result.success(getExternalStorageTotalSpaceInMB())
          "getExternalStorageFreeSpaceInMB" -> result.success(getExternalStorageFreeSpaceInMB())
          "getExternalStorageUsedSpaceInMB" -> result.success(getExternalStorageUsedSpaceInMB())
            
          "getExternalStorageTotalSpaceInGB" -> result.success(getExternalStorageTotalSpaceInGB())
          "getExternalStorageFreeSpaceInGB" -> result.success(getExternalStorageFreeSpaceInGB())
          "getExternalStorageUsedSpaceInGB" -> result.success(getExternalStorageUsedSpaceInGB())
          
          else -> result.notImplemented()
    }
  }

  @RequiresApi(Build.VERSION_CODES.JELLY_BEAN_MR2)
  fun getStorageTotalSpace(): Long{
      val path = Environment.getDataDirectory()
      val stat = StatFs(path.path)
      return stat.totalBytes
  }
  
  @RequiresApi(Build.VERSION_CODES.JELLY_BEAN_MR2)
  fun getStorageFreeSpace(): Long{
      val path = Environment.getDataDirectory()
      val stat = StatFs(path.path)
      Log.i("Internal", path.path)
      return stat.availableBytes
  }

  @RequiresApi(Build.VERSION_CODES.JELLY_BEAN_MR2)
  fun getStorageUsedSpace(): Long{
      val usedSpace: Long = getStorageTotalSpace() - getStorageFreeSpace()
      return usedSpace
  }

  @RequiresApi(Build.VERSION_CODES.JELLY_BEAN_MR2)
  fun getExternalStorageTotalSpace(): Long{
      val dirs: Array<File> = getExternalFilesDirs(context, null)
      val stat = StatFs(dirs[1].path.split("Android")[0])
      return stat.totalBytes
  }

  @RequiresApi(Build.VERSION_CODES.JELLY_BEAN_MR2)
  fun getExternalStorageFreeSpace(): Long{
      val dirs: Array<File> = getExternalFilesDirs(context, null)
      val stat = StatFs(dirs[1].path.split("Android")[0])
      return stat.availableBytes
  }

  @RequiresApi(Build.VERSION_CODES.JELLY_BEAN_MR2)
  fun getExternalStorageUsedSpace(): Long{
      val usedSpace: Long = getExternalStorageTotalSpace() - getExternalStorageFreeSpace()
      return usedSpace
  }
  
  // Storage space in MB
  @RequiresApi(Build.VERSION_CODES.JELLY_BEAN_MR2)
  fun getStorageFreeSpaceInMB(): Double{
      val freeSpace: Double = getStorageFreeSpace().toDouble() / 1024 / 1024
      return roundNumberTo2DecimalPlace(freeSpace)
  }
  
  @RequiresApi(Build.VERSION_CODES.JELLY_BEAN_MR2)
  fun getStorageUsedSpaceInMB(): Double{
      val usedSpace: Double = getStorageUsedSpace().toDouble() / 1024 /  1024
      return roundNumberTo2DecimalPlace(usedSpace)
  }

  @RequiresApi(Build.VERSION_CODES.JELLY_BEAN_MR2)
  fun getStorageTotalSpaceInMB(): Double{
      val totalSpace: Double = getStorageTotalSpace().toDouble() / 1024 /  1024
      return roundNumberTo2DecimalPlace(totalSpace)
  }
  
  // Storage space in GB
  @RequiresApi(Build.VERSION_CODES.JELLY_BEAN_MR2)
  fun getStorageFreeSpaceInGB(): Double{
      val freeSpace: Double = getStorageFreeSpace().toDouble() / 1024 / 1024 / 1024
      return roundNumberTo2DecimalPlace(freeSpace)
  }
  
  @RequiresApi(Build.VERSION_CODES.JELLY_BEAN_MR2)
  fun getStorageUsedSpaceInGB(): Double{
      val usedSpace: Double = getStorageUsedSpace().toDouble() / 1024 /  1024 / 1024
      return roundNumberTo2DecimalPlace(usedSpace)
  }

  @RequiresApi(Build.VERSION_CODES.JELLY_BEAN_MR2)
  fun getStorageTotalSpaceInGB(): Double{
      val totalSpace: Double = getStorageTotalSpace().toDouble() / 1024 /  1024 / 1024
      return roundNumberTo2DecimalPlace(totalSpace)
  }
  
  // External storage in MB
  @RequiresApi(Build.VERSION_CODES.JELLY_BEAN_MR2)
  fun getExternalStorageFreeSpaceInMB(): Double{
      val freeSpace: Double = getExternalStorageFreeSpace().toDouble() / 1024 / 1024 
      return roundNumberTo2DecimalPlace(freeSpace)
  }

  @RequiresApi(Build.VERSION_CODES.JELLY_BEAN_MR2)
  fun getExternalStorageUsedSpaceInMB(): Double{
      val usedSpace: Double = getExternalStorageUsedSpace().toDouble() / 1024 / 1024 
      return roundNumberTo2DecimalPlace(usedSpace)
  }

  @RequiresApi(Build.VERSION_CODES.JELLY_BEAN_MR2)
  fun getExternalStorageTotalSpaceInMB(): Double{
      val totalSpace: Double = getExternalStorageTotalSpace().toDouble() / 1024 / 1024 
      return roundNumberTo2DecimalPlace(totalSpace)
  }

  // External storage in GB
  @RequiresApi(Build.VERSION_CODES.JELLY_BEAN_MR2)
  fun getExternalStorageFreeSpaceInGB(): Double{
      val freeSpace: Double = getExternalStorageFreeSpace().toDouble() / 1024 / 1024 / 1024 
      return roundNumberTo2DecimalPlace(freeSpace)
  }

  @RequiresApi(Build.VERSION_CODES.JELLY_BEAN_MR2)
  fun getExternalStorageUsedSpaceInGB(): Double{
      val usedSpace: Double = getExternalStorageUsedSpace().toDouble() / 1024 / 1024 / 1024
      return roundNumberTo2DecimalPlace(usedSpace)
  }

  @RequiresApi(Build.VERSION_CODES.JELLY_BEAN_MR2)
  fun getExternalStorageTotalSpaceInGB(): Double{
      val totalSpace: Double = getExternalStorageTotalSpace().toDouble() / 1024 / 1024 / 1024
      return roundNumberTo2DecimalPlace(totalSpace)
  }
  
  fun roundNumberTo2DecimalPlace(value: Double) : Double {
   val number2digits: Double = String.format("%.2f", value).toDouble()
   return number2digits
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
