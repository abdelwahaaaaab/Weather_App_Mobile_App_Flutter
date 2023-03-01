import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService
{
  Future<WeatherModel?> getWeather({required String cityName}) async
  {
    WeatherModel? weather;
    try{
      String baseUrl = 'http://api.weatherapi.com/v1';
      String apiKey ='76b494a7eff742419e5193032232402';
      Uri url = Uri.parse('$baseUrl/current.json?key=$apiKey&q=$cityName&aqi=no');

      http.Response response =await http.get(url);

      Map<String, dynamic> data = jsonDecode(response.body);

      weather = WeatherModel(
      date:data['location']['localtime'],
      temp: data['current']['temp_c'],
      windSpeed: data['current']['wind_mph'],
      windDirection: data['current']['wind_dir'], 
      state: data['current']['condition']['text']
    );
    }
    catch(e)
    {
      print(e);
    }
    return weather;  
   }
}