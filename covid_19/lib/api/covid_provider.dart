import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:covid_19/model/covid_model.dart';

class CovidProvider{

  final String baseUrl = "https://api.covid19api.com/summary";

  Future <Covid> fetchCovidStats()async{
    var call = await http.get('$baseUrl');
    if(call.statusCode == 200){
      var json = jsonDecode(call.body);
      return Covid.fromJson(json);
    }
    return null;
  }  
}