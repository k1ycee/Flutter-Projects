import 'package:flutter/cupertino.dart';
import 'package:geek_quotes/api/quotes_api_provider.dart';
import 'package:geek_quotes/model/quotes_model.dart';

class QuotesViewModel extends ChangeNotifier{

  List<QuoteViewModel> zekwo = List<QuoteViewModel>();

  Future<void> dragQuotes()async{
    final kwote = await QuotesProvider().tellMe();
    this.zekwo = kwote.map((kwe) => QuoteViewModel(quotes: kwe)).toList();
    print(this.zekwo);
    notifyListeners();
  }

}

class QuoteViewModel{
  final Quotes quotes;

  QuoteViewModel({this.quotes});

  String get id{
    return quotes.id;
  }

  String get en{
    return quotes.en;
  }

  String get author{
    return quotes.author;
  }

  double get rating{
    return quotes.rating;
  } 

  String get quoteId{
    return quotes.quoteId;
  }
}