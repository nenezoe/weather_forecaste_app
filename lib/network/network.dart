import 'dart:convert';

import 'package:http/http.dart';
import 'package:weather_forecaste_app/model/weather_forecast_model.dart';
import 'package:weather_forecaste_app/util/forecast_util.dart';

class Network {
  Future<WeatherForecastModel> getWeatherForecast(String cityName) async{
    var finalUrl = "https://api.openweathermap.org/data/2.5/forecast/daily?q="+cityName+
        "&appid="+Util.appId+"&units=imperial"; //change to metric or imperial

    final response = await get(Uri.parse(Uri.encodeFull(finalUrl)));
    print("URL: ${Uri.encodeFull(finalUrl)}");

    if (response.statusCode == 200) {
      var decodedData = json.decode(response.body);
      String cityName = decodedData['city']['name'];
      String description = decodedData['list'][0]['weather'][0]['description'];
      print('$cityName \n $description');
      // we get the actual mapped model (dart object )
      // print("weather data: ${response.body}");
      return WeatherForecastModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Error getting weather forecast");
    }
  }
}