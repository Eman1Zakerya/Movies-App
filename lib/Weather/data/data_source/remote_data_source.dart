// import 'dart:convert';
//
//
// import 'package:dio/dio.dart';
//
// import '../../core/utils/constans.dart';
// import '../models/weather_model.dart';
//
//
// abstract class BaseRemoteDataSource{
//    Future<WeatherModel>getWeatherByCountryName(String countryName);
// }
//
// class RemoteDataSource implements BaseRemoteDataSource{
//   @override
//   Future<WeatherModel>getWeatherByCountryName(String countryName) async {
//     final dio = Dio();
//     final response = await dio.get('${AppConstants.baseUrl}/weather?q=$countryName&appid=${AppConstants.appKey}');
//     print(response.data);
//     return WeatherModel.fromJson(response.data);
//
//   }
// }