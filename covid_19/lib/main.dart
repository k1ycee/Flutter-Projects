import 'package:covid_19/bloc/covid_bloc.dart';
import 'package:covid_19/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


CovidRepo repo = CovidRepo();

void main() => runApp(Base(qwevid: repo,));

class Base extends StatelessWidget {

  final qwevid;
  Base({this.qwevid});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Covid Stats', style: TextStyle(color: Colors.red),),centerTitle: true, elevation: 0, backgroundColor: Colors.white,),
            body: BlocProvider(
            create: (context) => CovidBloc(covidRepo: repo)..add(FetchCov()),
            child: DashBoard(),
          ),
      ),
    );
  }
}

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CovidBloc, CovidState>(
      builder: (context, state){
        if(state is CovidInitial){
          return Center(child: SpinKitFadingFour(size: 80, color: Colors.red,));
        }
        if(state is CovError){
          return Center(child: Text('Well Would you look at that :)'),);
        }
        if(state is CovsReady){
          return Column(
            children: <Widget>[
              Container(
                child: 
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        height: 250,
                        width: 400,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                        child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              height: 200,
                              width: 400,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),color: Colors.amber),
                              child: Center(child: Text('${state.covid.global.totalConfirmed}\ncummulative confirmed'),),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              height: 200,
                              width: 400,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Colors.red),
                              child: Center(child: Text('${state.covid.global.totalDeaths}\ncummulative dead'),
                            ),
                          ),
                        ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              height: 200,
                              width: 400,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Colors.green),
                              child: Center(child: Text('${state.covid.global.totalRecovered}\n cummulative discharged',),
                            ),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              height: 200,
                              width: 400,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Colors.blue),
                              child: Center(child: Text('${state.covid.global.totalConfirmed - state.covid.global.totalRecovered - state.covid.global.totalDeaths}\nCummulative Still In Hospital Globally',),
                            ),
                          ),
                        ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              height: 200,
                              width: 400,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Colors.amber),
                              child: Center(child: Text('${state.covid.global.newConfirmed}\nNew Cases Globally',),
                            ),
                          ),
                        ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              height: 200,
                              width: 400,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Colors.red),
                              child: Center(child: Text('${state.covid.global.newDeaths}\nDied Today Globally',),
                            ),
                          ),
                        ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              height: 200,
                              width: 400,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Colors.green),
                              child: Center(child: Text('${state.covid.global.newRecovered}\nDischarged Today Globally',),
                            ),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              height: 200,
                              width: 400,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Colors.blue),
                              child: Center(child: Text('${state.covid.global.newConfirmed - state.covid.global.newDeaths - state.covid.global.newRecovered}\nStill in Hospital Globally'),
                            ),
                          ),
                        ),
                  ],
                  ),
                ),
                    )
              ),
            SizedBox(height: 10,),
              Expanded(
                child: ListView.builder(
                itemCount: state.covid.countries.length,
                itemBuilder: (context, index){
                  return ExpansionTile(
                    title: Text(state.covid.countries[index].country),
                    children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[Text('Confirmed Today'),Icon(Icons.check, color: Colors.blue,),Text(state.covid.countries[index].newConfirmed.toString())],),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[Text('Recovered Today'),Icon(Icons.accessibility_new, color: Colors.green,),Text(state.covid.countries[index].newRecovered.toString())],),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[Text('Dead Today'),Icon(Icons.cancel, color: Colors.red,),Text(state.covid.countries[index].newDeaths.toString())],),
                        ),
                                                Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[Text('Confirmed Total'),Icon(Icons.check, color: Colors.blue,),Text(state.covid.countries[index].totalConfirmed.toString())],),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[Text('Recovered Total'),Icon(Icons.accessibility_new, color: Colors.green,),Text(state.covid.countries[index].totalRecovered.toString())],),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[Text('Dead Total'),Icon(Icons.cancel, color: Colors.red,),Text(state.covid.countries[index].totalDeaths.toString())],),
                        ),
                    ],
                  );
                }
              ),
              ),
            ],
          );
        }
      },
    );
  }
}