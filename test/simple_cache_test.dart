import 'package:flutter_test/flutter_test.dart';
import 'package:simple_cache/simple_cache.dart';
import 'package:simple_cache/simple_cache_platform_interface.dart';
import 'package:simple_cache/simple_cache_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockSimpleCachePlatform
    with MockPlatformInterfaceMixin
    implements SimpleCachePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final SimpleCachePlatform initialPlatform = SimpleCachePlatform.instance;

  test('$MethodChannelSimpleCache is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelSimpleCache>());
  });

  test('getPlatformVersion', () async {
    SimpleCache simpleCachePlugin = SimpleCache();
    MockSimpleCachePlatform fakePlatform = MockSimpleCachePlatform();
    SimpleCachePlatform.instance = fakePlatform;

    expect(await simpleCachePlugin.getPlatformVersion(), '42');
  });
}
