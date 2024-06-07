import 'package:flutter/material.dart';
import 'package:movies_app/core/global/themes/theme_data/theme_data_dark.dart';
import 'package:movies_app/core/services/services_locator.dart';
import 'package:movies_app/movies/presentation/screens/more_populer_screen.dart';
import 'package:movies_app/movies/presentation/components/see_more_component.dart';
import 'Weather/data/data_source/remote_data_source.dart';
import 'Weather/data/repositry/weather_data_repository.dart';
import 'Weather/domain/reposetry/weather_reposetry.dart';
import 'Weather/domain/use_cases/get_weather_by_country.dart';
import 'Weather/presentation/screens/weather_screen.dart';
import 'core/utils/app_string.dart';
import 'movies/presentation/screens/movies_screen.dart';


void main()async {
 // BaseRemoteDataSource baseRemoteDataSource = RemoteDataSource();
 //  BaseWeatherRepository baseWeatherRepository = WeatherDataRepository(baseRemoteDataSource);
 //  await GetWeatherByCountry(baseWeatherRepository).execute('Egypy');
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
        title: AppString.appName,
        theme:ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.grey.shade900,
        ), //getThemeDataDark(),
      home:const MainMoviesScreen()//MainMoviesScreen() ,
    );
  }
}

// db457db129b7d270df1ac6e67503970b
