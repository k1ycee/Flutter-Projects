part of 'covid_bloc.dart';

abstract class CovidState extends Equatable {
  const CovidState();
  @override
  List<Object> get props => [];
}

class CovidInitial extends CovidState {}
class CovError extends CovidState{}
class CovsReady extends CovidState{
  final Covid covid;

  CovsReady({this.covid});
  @override
  List<Object> get props => [covid];
}