import 'package:flutter/material.dart';
import 'package:weather_forecaste_app/model/weather_forecast_model.dart';
import 'package:weather_forecaste_app/util/convert_icon.dart';
import 'package:weather_forecaste_app/util/forecast_util.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget forecastCard(AsyncSnapshot<WeatherForecastModel> snapshot, int index){
  var forecastList = snapshot.data?.list;
  var dayOfWeek = "";
  DateTime date = new DateTime.fromMillisecondsSinceEpoch(forecastList![index].dt! * 1000);
  var fullDate = Util.getFormattedDate(date);
  dayOfWeek = fullDate.split(",")[0];  // [Saturday,Dec 14,2019]

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Center(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(dayOfWeek),
      )),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            radius: 33,
            backgroundColor: Colors.white,
            child: getWeatherIcon(weatherDescription: forecastList[index].weather![0].main,
            color: Colors.pinkAccent, size: 45),
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text("${forecastList[index].temp?.min?.toStringAsFixed(0)}"),
                  ),
                  Icon(FontAwesomeIcons.solidArrowAltCircleDown, color: Colors.white,
                  size: 17,),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: <Widget>[
                    Text("Hum:${forecastList[index].humidity?.toStringAsFixed(0)} %"),
                    // Icon(fontAwesomeIcons.solidGrinBeamSweat, color: Colors.white,
                    //   size: 17,),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: <Widget>[
                    Text("Win:${forecastList[index].speed?.toStringAsFixed(0)} mi/h"),
                    // Icon(fontAwesomeIcons.wind, color: Colors.white,
                    //   size: 17,),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}