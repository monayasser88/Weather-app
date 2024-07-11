import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_update/cubits/cubit/get_weather_cubit_cubit.dart';
import 'package:weather_update/pages/home_page.dart';

void main() {
  runApp(const WeatherUpdate());
}

class WeatherUpdate extends StatelessWidget {
  const WeatherUpdate({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubitCubit(),
      child:  Builder(
        builder: (context) {
          return BlocBuilder<GetWeatherCubitCubit, GetWeatherCubitState>(
            builder: (context, state) {
              return MaterialApp(
                    theme: ThemeData(
                      primarySwatch: getThemeColor(
                          BlocProvider.of<GetWeatherCubitCubit>(context)
                              .weatherModel
                              ?.weatherCondition),
                    ),
                    debugShowCheckedModeBanner: false,
                    home: HomePage(),
              );
            },
          );
        }
      ));
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition.toLowerCase()) {
    case 'sunny':
      return Colors.orange;
    case 'clear':
      return Colors.lightBlue;
    case 'partly cloudy':
      return Colors.yellow;
    case 'cloudy':
      return Colors.grey;
    case 'overcast':
      return Colors.blueGrey;
    case 'mist':
      return Colors.indigo;
    case 'patchy rain possible':
      return Colors.lightBlue;
    case 'patchy snow possible':
      return Colors.lightBlue;
    case 'patchy sleet possible':
      return Colors.cyan;
    case 'patchy freezing drizzle possible':
      return Colors.teal;
    case 'thundery outbreaks possible':
      return Colors.deepPurple;
    case 'blowing snow':
      return Colors.lightBlue;
    case 'blizzard':
      return Colors.lightBlue;
    case 'fog':
      return Colors.grey;
    case 'freezing fog':
      return Colors.blueGrey;
    case 'patchy light drizzle':
      return Colors.lightBlue;
    case 'light drizzle':
      return Colors.blue;
    case 'freezing drizzle':
      return Colors.lightBlue;
    case 'heavy freezing drizzle':
      return Colors.blue;
    case 'patchy light rain':
    case 'patchy light snow':
    case 'light snow':
    case 'light snow':
    case 'patchy moderate snow':
    case 'moderate snow':
    case 'patchy heavy snow':
    case 'heavy snow':
    case 'light snow showers':
    case 'moderate or heavy snow showers':
      return Colors.lightBlue;
    case 'light rain':
      return Colors.blue;
    case 'moderate rain at times':
      return Colors.blue;
    case 'moderate rain':
      return Colors.blue;
    case 'heavy rain at times':
      return Colors.blue;
    case 'heavy rain':
      return Colors.blue;
    case 'light freezing rain':
      return Colors.lightBlue;
    case 'moderate or heavy freezing rain':
      return Colors.blue;
    case 'light sleet':
      return Colors.cyan;
    case 'moderate or heavy sleet':
      return Colors.cyan;
    case 'ice pellets':
      return Colors.grey;
    case 'light rain shower':
      return Colors.blue;
    case 'moderate or heavy rain shower':
      return Colors.blue;
    case 'torrential rain shower':
      return Colors.blue;
    case 'light sleet showers':
      return Colors.cyan;
    case 'moderate or heavy sleet showers':
      return Colors.cyan;
    case 'light showers of ice pellets':
      return Colors.grey;
    case 'moderate or heavy showers of ice pellets':
      return Colors.grey;
    case 'patchy light rain with thunder':
      return Colors.deepPurple;
    case 'moderate or heavy rain with thunder':
      return Colors.deepPurple;
    case 'patchy light snow with thunder':
      return Colors.deepPurple;
    case 'moderate or heavy snow with thunder':
      return Colors.deepPurple;
    default:
      return Colors.grey;
  }
}
