import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:weather_application/core/model/m_weather.dart';
import 'package:weather_application/core/services/dio_services.dart';
import 'package:weather_application/core/util/constats/all_enum.dart';
import 'package:weather_application/core/util/constats/end_points.dart';
import 'package:weather_application/core/util/constats/env.dart';

class HomeServices {
  DioServices dioServices = DioServices.instance;

  Future<MWeather> getWatherInfo({required String location}) async {
    Response response = await dioServices.makeRequest(
      EndPoints.watherEndpoint,
      method: HTTPMethod.get,
      queryParams: {"key": ENV.weatherApiKey, "q": location, "aqi": "no"},
    );
    if (response.statusCode == 200) {
      return MWeather.fromJson(
        Map<String, dynamic>.from((response.data)),
      );
    } else {
      throw "Somthing Want Wrong";
    }
  }
}
