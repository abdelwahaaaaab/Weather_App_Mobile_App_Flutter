import 'package:flutter/material.dart';

class WeatherModel
{
  final String date;
  final double temp;
  final double windSpeed;
  final String windDirection;
  final String state;
  WeatherModel({required this.date, required this.temp, required this.windSpeed, required this.windDirection, required this.state}); 
  String getImage()
  {
    if (state == 'Snow' || state == 'Sleet' || state == 'Light snow')
    {
      return'assets/images/snow.png';
    }
    else if(state == 'Clear')
    {
      return 'assets/images/clear.png';
    }
    else if(state == 'Hail' || state == 'Heavy Rain' || state == 'Light Rain' || state == 'Showers')
    {
      return 'assets/images/rainy.png';
    }
    else if(state == 'Thunderstorm' || state == 'Thunder')
    {
      return 'assets/images/thunderstorm.png';
    }
    else if(state == 'Heavy cloud' || state == 'Light Cloud' || state =='Partly cloudy')
    {
      return'assets/images/cloudy.png';
    }
    else
    {
      return 'assets/images/clear.png';
    }
  }
  MaterialColor getThemeColor()
  {
    if (state == 'Snow' || state == 'Sleet' || state == 'Light snow')
    {
      return Colors.lightBlue;
    }
    else if(state == 'Clear')
    {
      return Colors.orange;
    }
    else if(state == 'Hail' || state == 'Heavy Rain' || state == 'Light Rain' || state == 'Showers')
    {
      return Colors.cyan;
    }
    else if(state == 'Thunderstorm' || state == 'Thunder' || state == 'Mist'|| state == 'Fog')
    {
      return Colors.blueGrey;
    }
    else if(state == 'Heavy cloud' || state == 'Light Cloud' || state =='Partly cloudy' || state == 'Overcast')
    {
      return Colors.blue;
    }
    else
    {
      return Colors.deepOrange;
    }
  }
  @override
  String toString() {
    return 'date = $date  temp = $temp  windSpeed = $windSpeed  windDirection = $windDirection  state = $state';
  }
}
