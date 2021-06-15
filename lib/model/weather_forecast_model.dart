/// city : {"id":2267057,"name":"Lisbon","coord":{"lon":-9.1333,"lat":38.7167},"country":"PT","population":9999,"timezone":3600}
/// cod : "200"
/// message : 0.0621626
/// cnt : 7
/// list : [{"dt":1622376000,"sunrise":1622351675,"sunset":1622404437,"temp":{"day":295.95,"min":287.6,"max":297.47,"night":291.43,"eve":296.14,"morn":287.84},"feels_like":{"day":295.8,"night":291.19,"eve":295.83,"morn":287.64},"pressure":1016,"humidity":58,"weather":[{"id":800,"main":"Clear","description":"sky is clear","icon":"01d"}],"speed":5.38,"deg":327,"gust":7,"clouds":0,"pop":0},{"dt":1622462400,"sunrise":1622438049,"sunset":1622490880,"temp":{"day":295.49,"min":289.59,"max":297.18,"night":289.7,"eve":294.3,"morn":289.98},"feels_like":{"day":295.32,"night":289.66,"eve":294.06,"morn":289.6},"pressure":1012,"humidity":59,"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10d"}],"speed":4.96,"deg":279,"gust":7.31,"clouds":15,"pop":0.3,"rain":0.4},{"dt":1622548800,"sunrise":1622524425,"sunset":1622577322,"temp":{"day":293.34,"min":288.47,"max":293.56,"night":289.4,"eve":292.02,"morn":288.47},"feels_like":{"day":292.93,"night":289.17,"eve":291.63,"morn":288.25},"pressure":1013,"humidity":58,"weather":[{"id":802,"main":"Clouds","description":"scattered clouds","icon":"03d"}],"speed":5.53,"deg":247,"gust":6.45,"clouds":28,"pop":0},{"dt":1622635200,"sunrise":1622610803,"sunset":1622663763,"temp":{"day":293.61,"min":288.24,"max":293.61,"night":288.24,"eve":291.21,"morn":288.52},"feels_like":{"day":293.3,"night":287.76,"eve":290.69,"morn":288.41},"pressure":1015,"humidity":61,"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10d"}],"speed":7.57,"deg":328,"gust":10.88,"clouds":77,"pop":0.34,"rain":0.31},{"dt":1622721600,"sunrise":1622697182,"sunset":1622750202,"temp":{"day":294.03,"min":287.55,"max":294.03,"night":288.13,"eve":290.95,"morn":287.55},"feels_like":{"day":293.4,"night":287.59,"eve":290.33,"morn":286.93},"pressure":1019,"humidity":47,"weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04d"}],"speed":9.1,"deg":342,"gust":13.82,"clouds":96,"pop":0},{"dt":1622808000,"sunrise":1622783564,"sunset":1622836641,"temp":{"day":291.35,"min":287.04,"max":292.16,"night":288.2,"eve":290.58,"morn":287.75},"feels_like":{"day":290.77,"night":287.64,"eve":289.89,"morn":287.22},"pressure":1021,"humidity":59,"weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04d"}],"speed":8.19,"deg":324,"gust":12.38,"clouds":92,"pop":0},{"dt":1622894400,"sunrise":1622869947,"sunset":1622923078,"temp":{"day":293.3,"min":288.01,"max":293.79,"night":288.25,"eve":291.46,"morn":288.67},"feels_like":{"day":292.83,"night":287.67,"eve":290.81,"morn":288.24},"pressure":1023,"humidity":56,"weather":[{"id":803,"main":"Clouds","description":"broken clouds","icon":"04d"}],"speed":8.35,"deg":341,"gust":13.86,"clouds":76,"pop":0}]

class WeatherForecastModel {
  City? _city;
  String? _cod;
  double? _message;
  int? _cnt;
  List<Lista>? _list;

  City? get city => _city;
  String? get cod => _cod;
  double? get message => _message;
  int? get cnt => _cnt;
  List<Lista>? get list => _list;

  WeatherForecastModel(
      {City? city, String? cod, double? message, int? cnt, List<Lista>? list}) {
    _city = city;
    _cod = cod;
    _message = message;
    _cnt = cnt;
    _list = list;
  }

  WeatherForecastModel.fromJson(dynamic json) {
    _city = json["city"] != null ? City.fromJson(json["city"]) : null;
    _cod = json["cod"];
    _message = json["message"];
    _cnt = json["cnt"];
    if (json["list"] != null) {
      _list = [];
      json["list"].forEach((v) {
        _list?.add(Lista.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_city != null) {
      map["city"] = _city?.toJson();
    }
    map["cod"] = _cod;
    map["message"] = _message;
    map["cnt"] = _cnt;
    if (_list != null) {
      map["list"] = _list?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// dt : 1622376000
/// sunrise : 1622351675
/// sunset : 1622404437
/// temp : {"day":295.95,"min":287.6,"max":297.47,"night":291.43,"eve":296.14,"morn":287.84}
/// feels_like : {"day":295.8,"night":291.19,"eve":295.83,"morn":287.64}
/// pressure : 1016
/// humidity : 58
/// weather : [{"id":800,"main":"Clear","description":"sky is clear","icon":"01d"}]
/// speed : 5.38
/// deg : 327
/// gust : 7
/// clouds : 0
/// pop : 0

class Lista {
  int? _dt;
  int? _sunrise;
  int? _sunset;
  Temp? _temp;
  Feels_like? _feelsLike;
  int? _pressure;
  int? _humidity;
  List<Weather>? _weather;
  double? _speed;
  int? _deg;
  int? _gust;
  int? _clouds;
  int? _pop;

  int? get dt => _dt;
  int? get sunrise => _sunrise;
  int? get sunset => _sunset;
  Temp? get temp => _temp;
  Feels_like? get feelsLike => _feelsLike;
  int? get pressure => _pressure;
  int? get humidity => _humidity;
  List<Weather>? get weather => _weather;
  double? get speed => _speed;
  int? get deg => _deg;
  int? get gust => _gust;
  int? get clouds => _clouds;
  int? get pop => _pop;

  Lista(
      {int? dt,
      int? sunrise,
      int? sunset,
      Temp? temp,
      Feels_like? feelsLike,
      int? pressure,
      int? humidity,
      List<Weather>? weather,
      double? speed,
      int? deg,
      int? gust,
      int? clouds,
      int? pop}) {
    _dt = dt;
    _sunrise = sunrise;
    _sunset = sunset;
    _temp = temp;
    _feelsLike = feelsLike;
    _pressure = pressure;
    _humidity = humidity;
    _weather = weather;
    _speed = speed;
    _deg = deg;
    _gust = gust;
    _clouds = clouds;
    _pop = pop;
  }

  Lista.fromJson(dynamic json) {
    _dt = json["dt"];
    _sunrise = json["sunrise"];
    _sunset = json["sunset"];
    _temp = json["temp"] != null ? Temp.fromJson(json["temp"]) : null;
    _feelsLike = json["feels_like"] != null
        ? Feels_like.fromJson(json["feelsLike"])
        : null;
    _pressure = json["pressure"];
    _humidity = json["humidity"];
    if (json["weather"] != null) {
      _weather = [];
      json["weather"].forEach((v) {
        _weather?.add(Weather.fromJson(v));
      });
    }
    _speed = json["speed"];
    _deg = json["deg"];
    _gust = json["gust"];
    _clouds = json["clouds"];
    _pop = json["pop"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["dt"] = _dt;
    map["sunrise"] = _sunrise;
    map["sunset"] = _sunset;
    if (_temp != null) {
      map["temp"] = _temp?.toJson();
    }
    if (_feelsLike != null) {
      map["feels_like"] = _feelsLike?.toJson();
    }
    map["pressure"] = _pressure;
    map["humidity"] = _humidity;
    if (_weather != null) {
      map["weather"] = _weather?.map((v) => v.toJson()).toList();
    }
    map["speed"] = _speed;
    map["deg"] = _deg;
    map["gust"] = _gust;
    map["clouds"] = _clouds;
    map["pop"] = _pop;
    return map;
  }
}

/// id : 800
/// main : "Clear"
/// description : "sky is clear"
/// icon : "01d"

class Weather {
  int? _id;
  String? _main;
  String? _description;
  String? _icon;

  int? get id => _id;
  String? get main => _main;
  String? get description => _description;
  String? get icon => _icon;

  Weather({int? id, String? main, String? description, String? icon}) {
    _id = id;
    _main = main;
    _description = description;
    _icon = icon;
  }

  Weather.fromJson(dynamic json) {
    _id = json["id"];
    _main = json["main"];
    _description = json["description"];
    _icon = json["icon"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["main"] = _main;
    map["description"] = _description;
    map["icon"] = _icon;
    return map;
  }
}

/// day : 295.8
/// night : 291.19
/// eve : 295.83
/// morn : 287.64

// ignore: camel_case_types
class Feels_like {
  double? _day;
  double? _night;
  double? _eve;
  double? _morn;

  double? get day => _day;
  double? get night => _night;
  double? get eve => _eve;
  double? get morn => _morn;

  Feels_like({double? day, double? night, double? eve, double? morn}) {
    _day = day;
    _night = night;
    _eve = eve;
    _morn = morn;
  }

  Feels_like.fromJson(Map<String, dynamic> json) {
    _day = json["day"].toDouble();
    _night = json["night"].toDouble();
    _eve = json["eve"].toDouble();
    _morn = json["morn"].toDouble();
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["day"] = _day;
    map["night"] = _night;
    map["eve"] = _eve;
    map["morn"] = _morn;
    return map;
  }
}

/// day : 295.95
/// min : 287.6
/// max : 297.47
/// night : 291.43
/// eve : 296.14
/// morn : 287.84

class Temp {
  double? _day;
  double? _min;
  double? _max;
  double? _night;
  double? _eve;
  double? _morn;

  double? get day => _day;
  double? get min => _min;
  double? get max => _max;
  double? get night => _night;
  double? get eve => _eve;
  double? get morn => _morn;

  Temp(
      {double? day,
      double? min,
      double? max,
      double? night,
      double? eve,
      double? morn}) {
    _day = day;
    _min = min;
    _max = max;
    _night = night;
    _eve = eve;
    _morn = morn;
  }

  Temp.fromJson(Map<String, dynamic> json) {
    _day = json["day"].toDouble();
    _min = json["min"].toDouble();
    _max = json["max"].toDouble();
    _night = json["night"].toDouble();
    _eve = json["eve"].toDouble();
    _morn = json["morn"].toDouble();
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["day"] = _day;
    map["min"] = _min;
    map["max"] = _max;
    map["night"] = _night;
    map["eve"] = _eve;
    map["morn"] = _morn;
    return map;
  }
}

/// id : 2267057
/// name : "Lisbon"
/// coord : {"lon":-9.1333,"lat":38.7167}
/// country : "PT"
/// population : 9999
/// timezone : 3600

class City {
  int? _id;
  String? _name;
  Coord? _coord;
  String? _country;
  int? _population;
  int? _timezone;

  int? get id => _id;
  String? get name => _name;
  Coord? get coord => _coord;
  String? get country => _country;
  int? get population => _population;
  int? get timezone => _timezone;

  City(
      {int? id,
      String? name,
      Coord? coord,
      String? country,
      int? population,
      int? timezone}) {
    _id = id;
    _name = name;
    _coord = coord;
    _country = country;
    _population = population;
    _timezone = timezone;
  }

  City.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
    _coord = json["coord"] != null ? Coord.fromJson(json["coord"]) : null;
    _country = json["country"];
    _population = json["population"];
    _timezone = json["timezone"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    if (_coord != null) {
      map["coord"] = _coord?.toJson();
    }
    map["country"] = _country;
    map["population"] = _population;
    map["timezone"] = _timezone;
    return map;
  }
}

/// lon : -9.1333
/// lat : 38.7167

class Coord {
  double? _lon;
  double? _lat;

  double? get lon => _lon;
  double? get lat => _lat;

  Coord({double? lon, double? lat}) {
    _lon = lon;
    _lat = lat;
  }

  Coord.fromJson(dynamic json) {
    _lon = json["lon"];
    _lat = json["lat"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["lon"] = _lon;
    map["lat"] = _lat;
    return map;
  }
}
