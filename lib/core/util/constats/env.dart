import 'package:flutter/foundation.dart';

class ENV{

  /// true if the application is running in production mode.
  static const bool isLive = !kDebugMode;
  static const baseUrl = isLive? "http://api.weatherapi.com/v1":"http://api.weatherapi.com/v1";
  static const weatherApiKey = "";
}