import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'simple_cache_platform_interface.dart';

/// An implementation of [SimpleCachePlatform] that uses method channels.
class MethodChannelSimpleCache extends SimpleCachePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('simple_cache');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
