import 'package:flutter/material.dart';
import 'package:geek_quotes/api/quotes_api_provider.dart';
import 'package:geek_quotes/model/quotes_model.dart';

class QuoteViewModel extends ChangeNotifier{

  List<QuotesViewModel> qvModel = List<QuotesViewModel>();

  Future<void> dquotes()async{
    final res = await QuotesProvider().tellMe();
    this.qvModel = res.map((fun) => QuotesViewModel(quotes: fun)).toList();
    print(res);
    notifyListeners();
  }
}



class QuotesViewModel{

  final Quotes quotes;
  QuotesViewModel({this.quotes});

  String get id{
    return quotes.id;
  }

  String get quote{
    return quotes.en;
  }

  String get author{
    return quotes.author;
  }

  String get quoteId{
    return quotes.quoteId;
  }

  double get rating{
    return quotes.rating;
  }
}