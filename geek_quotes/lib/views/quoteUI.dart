import 'package:flutter/material.dart';
import 'package:geek_quotes/view_model/quotes_view_model.dart';
import 'package:provider_architecture/provider_architecture.dart';


class Quote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<QuotesViewModel>.withConsumer(
      viewModelBuilder:() => QuotesViewModel(),
      onModelReady: (model) => model.dragQuotes(),
      builder: (context, model, _) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('Quotes', style: TextStyle(color: Colors.black),),
          centerTitle: true,
          elevation: 0,
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: model.zekwo.length,
                  itemBuilder: (context, index){
                    return ListTile(
                      leading: Text('${model.zekwo[index].author}'),
                      title: Text('${model.zekwo[index].en}'),
                      trailing: Text('${model.zekwo[index].rating}'),
                    );
                  }
                ),
              ),
            ],
          ),
        ),
      ) 
    );
  }    
}