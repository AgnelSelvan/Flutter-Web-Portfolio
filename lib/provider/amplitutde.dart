import 'dart:developer';

import 'package:amplitude_flutter/amplitude.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/core/constants/environment.dart';

final amplitudeProvider =
    ChangeNotifierProvider(((ref) => AmplitutdeProvider()));

class AmplitutdeProvider extends ChangeNotifier {
  Amplitude? analytics;
  late DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  AmplitutdeProvider() {
    analytics = Amplitude.getInstance(instanceName: "agnel-selvan");
    analytics?.init(AppEnvironment.amplitudeAPIKey);
  }

  Future<void> logStartupEvent() async {
    Map<String, String> info = {};
    if (kIsWeb) {
      WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;

      info.addAll({
        "browser": webBrowserInfo.browserName.name,
        "platform": webBrowserInfo.platform.toString(),
        "userAgent": webBrowserInfo.userAgent.toString(),
        "product": webBrowserInfo.product.toString(),
        "vendor": webBrowserInfo.vendor.toString(),
        "language": webBrowserInfo.language.toString(),
      });
    }
    log("info: $info");
    analytics?.logEvent('startup', eventProperties: info);
  }

  Future<void> logAScreen(String screenName) async {
    Map<String, String> info = {};

    info.addAll({
      "screenName": screenName,
    });

    log("info: $info");
    analytics?.logEvent('screens_log', eventProperties: info);
  }

  Future<void> logJsonParseError(Map<String, dynamic> json) async {
    log("info: $json");
    analytics?.logEvent('json_parse_error', eventProperties: json);
  }
}
