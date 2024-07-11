import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_update/cubits/cubit/get_weather_cubit_cubit.dart';
import 'package:weather_update/main.dart';
import 'package:weather_update/models/weather_model.dart';

class Info extends StatelessWidget {
  const Info({super.key, required this.weather});
  final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubitCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(gradient: LinearGradient(colors:
      [getThemeColor(weatherModel.weatherCondition),
      getThemeColor(weatherModel.weatherCondition)[300]!,
      getThemeColor(weatherModel.weatherCondition)[100]!],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(flex: 3),
          Text(
            weatherModel.cityName,
            style: TextStyle(
                fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'updated: ${weatherModel.date.hour}:${weatherModel.date.minute}',
            style: TextStyle(fontSize: 24, color: Colors.black),
          ),
          Spacer(
            flex: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network('https:${weatherModel.image!}'),
              Text(
                weatherModel.temp.toString(),
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Column(
                children: [
                  Text(
                    'maxTemp: ${weatherModel.maxTemp}',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  Text(
                    'minTemp: ${weatherModel.minTemp}',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ],
              )
            ],
          ),
          Spacer(flex: 1),
          Text(
            weatherModel.weatherCondition,
            style: TextStyle(
                fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Spacer(flex: 5),
        ],
      ),
    );
  }
}
