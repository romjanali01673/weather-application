double _toDouble(dynamic value) {
  if (value == null) return 0.0;
  if (value is int) return value.toDouble();
  if (value is double) return value;
  return double.tryParse(value.toString()) ?? 0.0;
}

class MWeather {
  Location location;
  Current current;

  MWeather({
    required this.location,
    required this.current,
  });

  factory MWeather.fromJson(Map<String, dynamic> json) => MWeather(
        location: Location.fromJson(json["location"]),
        current: Current.fromJson(json["current"]),
      );

  Map<String, dynamic> toJson() => {
        "location": location.toJson(),
        "current": current.toJson(),
      };
}

class Current {
  double lastUpdatedEpoch;
  String lastUpdated;
  double tempC;
  double tempF;
  double isDay;
  Condition condition;
  double windMph;
  double windKph;
  double windDegree;
  String windDir;
  double pressureMb;
  double pressureIn;
  double precipMm;
  double precipIn;
  double humidity;
  double cloud;
  double feelslikeC;
  double feelslikeF;
  double windchillC;
  double windchillF;
  double heatindexC;
  double heatindexF;
  double dewpointC;
  double dewpointF;
  double visKm;
  double visMiles;
  double uv;
  double gustMph;
  double gustKph;
  double shortRad;
  double diffRad;
  double dni;
  double gti;

  Current({
    required this.lastUpdatedEpoch,
    required this.lastUpdated,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.windDir,
    required this.pressureMb,
    required this.pressureIn,
    required this.precipMm,
    required this.precipIn,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.feelslikeF,
    required this.windchillC,
    required this.windchillF,
    required this.heatindexC,
    required this.heatindexF,
    required this.dewpointC,
    required this.dewpointF,
    required this.visKm,
    required this.visMiles,
    required this.uv,
    required this.gustMph,
    required this.gustKph,
    required this.shortRad,
    required this.diffRad,
    required this.dni,
    required this.gti,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        lastUpdatedEpoch: _toDouble(json["last_updated_epoch"]),
        lastUpdated: json["last_updated"],
        tempC: _toDouble(json["temp_c"]),
        tempF: _toDouble(json["temp_f"]),
        isDay: _toDouble(json["is_day"]),
        condition: Condition.fromJson(json["condition"]),
        windMph: _toDouble(json["wind_mph"]),
        windKph: _toDouble(json["wind_kph"]),
        windDegree: _toDouble(json["wind_degree"]),
        windDir: json["wind_dir"],
        pressureMb: _toDouble(json["pressure_mb"]),
        pressureIn: _toDouble(json["pressure_in"]),
        precipMm: _toDouble(json["precip_mm"]),
        precipIn: _toDouble(json["precip_in"]),
        humidity: _toDouble(json["humidity"]),
        cloud: _toDouble(json["cloud"]),
        feelslikeC: _toDouble(json["feelslike_c"]),
        feelslikeF: _toDouble(json["feelslike_f"]),
        windchillC: _toDouble(json["windchill_c"]),
        windchillF: _toDouble(json["windchill_f"]),
        heatindexC: _toDouble(json["heatindex_c"]),
        heatindexF: _toDouble(json["heatindex_f"]),
        dewpointC: _toDouble(json["dewpoint_c"]),
        dewpointF: _toDouble(json["dewpoint_f"]),
        visKm: _toDouble(json["vis_km"]),
        visMiles: _toDouble(json["vis_miles"]),
        uv: _toDouble(json["uv"]),
        gustMph: _toDouble(json["gust_mph"]),
        gustKph: _toDouble(json["gust_kph"]),
        shortRad: _toDouble(json["short_rad"]),
        diffRad: _toDouble(json["diff_rad"]),
        dni: _toDouble(json["dni"]),
        gti: _toDouble(json["gti"]),
      );

  Map<String, dynamic> toJson() => {
        "last_updated_epoch": lastUpdatedEpoch,
        "last_updated": lastUpdated,
        "temp_c": tempC,
        "temp_f": tempF,
        "is_day": isDay,
        "condition": condition.toJson(),
        "wind_mph": windMph,
        "wind_kph": windKph,
        "wind_degree": windDegree,
        "wind_dir": windDir,
        "pressure_mb": pressureMb,
        "pressure_in": pressureIn,
        "precip_mm": precipMm,
        "precip_in": precipIn,
        "humidity": humidity,
        "cloud": cloud,
        "feelslike_c": feelslikeC,
        "feelslike_f": feelslikeF,
        "windchill_c": windchillC,
        "windchill_f": windchillF,
        "heatindex_c": heatindexC,
        "heatindex_f": heatindexF,
        "dewpoint_c": dewpointC,
        "dewpoint_f": dewpointF,
        "vis_km": visKm,
        "vis_miles": visMiles,
        "uv": uv,
        "gust_mph": gustMph,
        "gust_kph": gustKph,
        "short_rad": shortRad,
        "diff_rad": diffRad,
        "dni": dni,
        "gti": gti,
      };
}

class Condition {
  String text;
  String icon;
  double code;

  Condition({
    required this.text,
    required this.icon,
    required this.code,
  });

  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
        text: json["text"],
        icon: json["icon"],
        code: _toDouble(json["code"]),
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "icon": icon,
        "code": code,
      };
}

class Location {
  String name;
  String region;
  String country;
  double lat;
  double lon;
  String tzId;
  double localtimeEpoch;
  String localtime;

  Location({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.tzId,
    required this.localtimeEpoch,
    required this.localtime,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"],
        region: json["region"],
        country: json["country"],
        lat: _toDouble(json["lat"]),
        lon: _toDouble(json["lon"]),
        tzId: json["tz_id"],
        localtimeEpoch: _toDouble(json["localtime_epoch"]),
        localtime: json["localtime"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "region": region,
        "country": country,
        "lat": lat,
        "lon": lon,
        "tz_id": tzId,
        "localtime_epoch": localtimeEpoch,
        "localtime": localtime,
      };
}
