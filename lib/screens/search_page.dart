import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/weather_services.dart';
//import 'package:flutter/src/widgets/framework.dart';
//import 'package:flutter/src/widgets/placeholder.dart';

class SearchPage extends StatelessWidget {
  VoidCallback? updateUi;
  String? city;
  SearchPage({super.key, this.updateUi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('Search a City'),),
      body: Padding(
        padding:const EdgeInsets.symmetric(horizontal: 16),
        child:  Center(
          child: TextField(
           
            onSubmitted: (data) async{
              city = data;
              WeatherService service = WeatherService();
              //service.getWeather(cityName: city!);
              WeatherModel? weather =await service.getWeather(cityName: city!);
              Provider.of<WeatherProvider>(context, listen: false).weatherData = weather;
              Provider.of<WeatherProvider>(context, listen: false).cityName = city;
              Navigator.pop(context);
              //print(weather);
            },
             onChanged: (data) {
              city = data;
            },
            decoration: InputDecoration(
              label:const Text('Search'),
              hintText: 'Enter City Name',
              contentPadding:const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
              border:const OutlineInputBorder(),
              suffixIcon: GestureDetector(
                onTap:() async{
                  WeatherService service = WeatherService();
                  //service.getWeather(cityName: city!);
                  WeatherModel? weather =await service.getWeather(cityName: city!);
                  Provider.of<WeatherProvider>(context, listen: false).weatherData = weather;
                  Provider.of<WeatherProvider>(context, listen: false).cityName = city;
                  Navigator.pop(context);
                },
                child: Icon(Icons.search)
                ),
            ),
          ),
        ),
      ),
    );
  }
}
//WeatherModel? weatherData ;