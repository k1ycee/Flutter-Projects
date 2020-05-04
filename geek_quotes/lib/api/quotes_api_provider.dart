import 'dart:convert';

import 'package:geek_quotes/model/quotes_model.dart';
import 'package:http/http.dart' as http;

class QuotesProvider{

  Future<List<Quotes>> tellMe()async{
    final talk = await http.get('https://programming-quotes-api.herokuapp.com/quotes/lang/en');
    if(talk.statusCode == 200){ 
      final Iterable theJson = jsonDecode(talk.body);
      return theJson.map((kwe) => Quotes.fromJson(kwe)).toList();
    }
    return null;
  }
}