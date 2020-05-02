import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:covid_19/model/covid_model.dart';
import 'package:covid_19/repository.dart';
import 'package:equatable/equatable.dart';

part 'covid_event.dart';
part 'covid_state.dart';

class CovidBloc extends Bloc<CovidEvent, CovidState> {

  final CovidRepo covidRepo;
  CovidBloc({this.covidRepo}) : assert(covidRepo != null);

  @override
  CovidState get initialState => CovidInitial();

  @override
  Stream<CovidState> mapEventToState(
    CovidEvent event,
  ) async* {
    if(event is FetchCov){
      yield CovidInitial();
      try{
        final Covid covfefe = await covidRepo.getcovs();
        yield CovsReady(covid: covfefe);
      }
      catch(e){
        CovError();
      }
    }
  }
}
