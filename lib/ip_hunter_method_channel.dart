import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'ip_hunter_platform_interface.dart';

/// An implementation of [IpHunterPlatform] that uses method channels.
class MethodChannelIpHunter extends IpHunterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('ip_hunter');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
