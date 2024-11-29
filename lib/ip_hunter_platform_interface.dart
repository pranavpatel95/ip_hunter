import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'ip_hunter_method_channel.dart';

abstract class IpHunterPlatform extends PlatformInterface {
  /// Constructs a IpHunterPlatform.
  IpHunterPlatform() : super(token: _token);

  static final Object _token = Object();

  static IpHunterPlatform _instance = MethodChannelIpHunter();

  /// The default instance of [IpHunterPlatform] to use.
  ///
  /// Defaults to [MethodChannelIpHunter].
  static IpHunterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [IpHunterPlatform] when
  /// they register themselves.
  static set instance(IpHunterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
