import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'search_page.dart';
import 'package:weather_app/providers/weather_provider.dart';
//import 'package:flutter/src/widgets/framework.dart';
//import 'package:flutter/src/widgets/placeholder.dart';

class HomePage extends StatefulWidget {

  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    WeatherModel? weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder:(context)
                {
                  return SearchPage(); 
                }
                 )
                 );
            },
            icon:const Icon(Icons.search))
        ],
        title:const Text('Weather App'),
      ),
      body:weatherData == null? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const[
            Text(
              'there is no weather 😔 start',
              style: TextStyle(
                fontSize: 30,
              ),
              ),
            Text(
              'searching now 🔍',
              style: TextStyle(
                fontSize: 30,
              ),
              ),
          ],
        ),
      )
      : 
      Container(
        decoration:BoxDecoration(
          gradient:  LinearGradient(
          colors: [
            weatherData.getThemeColor(),
            weatherData.getThemeColor()[300]!,
            weatherData.getThemeColor()[200]!,
            weatherData.getThemeColor()[100]!,
            weatherData.getThemeColor()[50]!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          ),
        ),
        
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Spacer(flex: 3,),
            Column(
              children: [
                Text(
                  Provider.of<WeatherProvider>(context).cityName!,
                  style:const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Updated at: ${weatherData.date}'),
              ],
            ),
            const Spacer(flex: 1,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(weatherData.getImage()),
                Text(
                  weatherData.temp.toInt().toString(),
                  style:const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'Wind Speed: ${weatherData.windSpeed}',
                      style:const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      'Wind Direction: ${weatherData.windDirection}',
                      style:const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const Spacer(flex: 1,),
            Text(
              weatherData.state,
              style:const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            //const Spacer(flex: 2,),
            const Spacer(flex: 5,),
          ],
        ),
      ),
      
      
    );
  }
}