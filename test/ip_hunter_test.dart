import 'package:flutter_test/flutter_test.dart';
import 'package:ip_hunter/ip_hunter.dart';
import 'package:ip_hunter/ip_hunter_platform_interface.dart';
import 'package:ip_hunter/ip_hunter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockIpHunterPlatform
    with MockPlatformInterfaceMixin
    implements IpHunterPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final IpHunterPlatform initialPlatform = IpHunterPlatform.instance;

  test('$MethodChannelIpHunter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelIpHunter>());
  });

  test('getPlatformVersion', () async {
    IpHunter ipHunterPlugin = IpHunter();
    MockIpHunterPlatform fakePlatform = MockIpHunterPlatform();
    IpHunterPlatform.instance = fakePlatform;

    expect(await ipHunterPlugin.getPlatformVersion(), '42');
  });
}
