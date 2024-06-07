//
//
// import '../../domain/entities/weather.dart';
// import '../../domain/reposetry/weather_reposetry.dart';
// import '../data_source/remote_data_source.dart';
//
// class WeatherDataRepository implements BaseWeatherRepository{
//   late final BaseRemoteDataSource baseRemoteDataSource;
//
//   WeatherDataRepository(this.baseRemoteDataSource);
//   @override
//   Future<Weather> getWeatherByCityName(String countryName)async {
//      return await baseRemoteDataSource.getWeatherByCountryName(countryName);
//   }
//
//
// }