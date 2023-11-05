import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/core/connection/network_info.dart';
import 'package:weather_app/features/weather/business/usecase/get_weather.dart';
import 'package:weather_app/features/weather/data/datasource/weather_local_data_source.dart';
import 'package:weather_app/features/weather/data/datasource/weather_remote_data_source.dart';
import 'package:weather_app/features/weather/data/repositories/weather_repository_impl.dart';

class InitBindings extends Bindings {
  @override
  void dependencies() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    final connectionChecker = DataConnectionChecker();

    Get.put(WeatherRepositoryImpl(
      weatherLocalDataSource: Get.put<WeatherLocalDataSource>(
          WeatherLocalDataSourceImpl(sharedPreferences: sharedPreferences)),
      weatherRemoteDataSource:
          Get.put<WeatherRemoteDataSource>(WeatherRemoteDataSourceImpl()),
      networkInfo: Get.put<NetworkInfo>(NetworkInfoImpl(connectionChecker)),
    ));

    Get.put(GetWeather(
      weatherRepository: Get.find<WeatherRepositoryImpl>(),
    ));
  }
}
