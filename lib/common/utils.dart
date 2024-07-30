import 'package:intl/intl.dart';

String getShortLocationName(String s) {
  List<String> locationList = s.split(' ');

  if (locationList.isNotEmpty) {
    if (locationList.length > 1) {
      return '${locationList.first} ${locationList[1]}';
    }
    return locationList.first;
  }

  return ' ';
}

Map getForecastWeather(dynamic weatherData, int index) {
  int maxWindSpeed = weatherData[index]["day"]["maxwind_kph"].toInt();
  int avgHumidity = weatherData[index]["day"]["avghumidity"].toInt();
  int chanceOfRain =
  weatherData[index]["day"]["daily_chance_of_rain"].toInt();

  var parsedDate = DateTime.parse(weatherData[index]["date"]);
  var forecastDate = DateFormat('EEEE, d MMMM').format(parsedDate);

  String weatherName = weatherData[index]["day"]["condition"]["text"];
  String weatherIcon = "${weatherName.replaceAll(' ', '').toLowerCase()}.png";

  int minTemperature = weatherData[index]["day"]["mintemp_c"].toInt();
  int maxTemperature = weatherData[index]["day"]["maxtemp_c"].toInt();

  var forecastData = {
    'maxWindSpeed': maxWindSpeed,
    'avgHumidity': avgHumidity,
    'chanceOfRain': chanceOfRain,
    'forecastDate': forecastDate,
    'weatherName': weatherName,
    'weatherIcon': weatherIcon,
    'minTemperature': minTemperature,
    'maxTemperature': maxTemperature
  };
  return forecastData;
}