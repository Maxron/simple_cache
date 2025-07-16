import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'simple_cache_method_channel.dart';

abstract class SimpleCachePlatform extends PlatformInterface {
  /// Constructs a SimpleCachePlatform.
  SimpleCachePlatform() : super(token: _token);

  static final Object _token = Object();

  static SimpleCachePlatform _instance = MethodChannelSimpleCache();

  /// The default instance of [SimpleCachePlatform] to use.
  ///
  /// Defaults to [MethodChannelSimpleCache].
  static SimpleCachePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SimpleCachePlatform] when
  /// they register themselves.
  static set instance(SimpleCachePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
