import 'package:covid_19/api/covid_provider.dart';
import 'package:covid_19/model/covid_model.dart';

class CovidRepo{
  Future<Covid> getcovs() => CovidProvider().fetchCovidStats();
}