import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_update/cubits/cubit/get_weather_cubit_cubit.dart';
import 'package:weather_update/pages/info.dart';
import 'package:weather_update/pages/no_weather_info.dart';
import 'package:weather_update/pages/search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Weather App',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return SearchPage();
                }));
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: BlocBuilder<GetWeatherCubitCubit, GetWeatherCubitState>(
        builder: (context, state) {
          try {
            if (state is GetWeatherCubitInitial) {
              return NoWeatherInfo();
            } else if (state is WeatherLoadedState) {
              return Info(weather: state.weatherModel ,);
            } else if (state is WeatherFailureState) {
              return Center(child: Text('oops! there is an error'));
            }
          } on Exception catch (e) {
            // TODO
            print(e.toString());
          }
          return const Center(child: Text(' there is an error'));
        },
      ),
    );
  }
}
