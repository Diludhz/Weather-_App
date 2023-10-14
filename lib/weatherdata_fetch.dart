import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app_prg1/weathermodel.dart';

class WeatherData {
  Future<Weather> getData(var latiude, var longitude) async {
    var urlCall = Uri.parse(
        "http://api.weatherapi.com/v1/current.json?key=7161029970e64fd4a1c190812231310&q=$latiude,$longitude&aqi=no");
    var response = await http.get(urlCall);
    var body = jsonDecode(response.body);
    return Weather.fromJson(body);
  }
}
