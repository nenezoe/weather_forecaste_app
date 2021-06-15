import 'package:flutter/material.dart';
import 'package:weather_forecaste_app/model/weather_forecast_model.dart';
import 'package:weather_forecaste_app/network/network.dart';
import 'package:weather_forecaste_app/ui/bottom_view.dart';
import 'package:weather_forecaste_app/ui/mid_view.dart';
// Better way of doing business!
class WeatherForecast extends StatefulWidget {
  @override
  _WeatherForecastState createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  late Future<WeatherForecastModel> forecastObject;
  String _cityName = "Mumbai";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forecastObject = getWeather(cityName: _cityName);

    // forecastObject.then((weather) {
    //   print(weather.list[0].weather[0].main);
    // });


  }

  Future<WeatherForecastModel> getWeather({String? cityName}) =>
      Network().getWeatherForecast(_cityName);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          textFieldView(),
          Container(
            child: FutureBuilder<WeatherForecastModel>(
              future: forecastObject,
              builder: (BuildContext context, AsyncSnapshot<WeatherForecastModel> snapshot){
                if(snapshot.hasData) {
                  return Column(
                    children: <Widget>[
                      MidView(snapshot: snapshot,),
                      //midView(snapshot),
                      BottomView(snapshot: snapshot),
                    ],
                  );
                }else {
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(),),
                    );
                }
              }),//FutureBuilder
            ),
        ]
      ),
    );
  }

  Widget textFieldView() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: TextField(
          decoration: InputDecoration(
            hintText: "Enter City Name",
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)),
            contentPadding: EdgeInsets.all(8)
          ),
            onSubmitted: (value) {
            setState(() {
              _cityName = value;
              forecastObject = new Network().getWeatherForecast(_cityName);
            });
            },
        ),
      ),
    );
  }
}
