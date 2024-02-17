import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weathe_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weathe_cubit/get_weather_state.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffAEAEAE),
          title: const Text(
            'Weather App',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return SearchView();
                  }),
                );
              },
              icon: Icon(Icons.search),
              color: Colors.white,
              iconSize: 28,
            )
          ],
        ),
        body: BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is WeatherInitialState) {
              return NoWeather();
            } else if (state is WeatherLoadedSuccesState) {
              return WeatherInfoBody(
                weatherModel: state.weatherModel,
              );
            } else {
              return const Text('There was an error ');
            }
          },
        ));
  }
}
