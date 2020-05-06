import 'package:geek_quotes/api/quotes_api_provider.dart';
import 'package:geek_quotes/model/quotes_model.dart';

class QuotesRepo{
  Future<List<Quotes>> getQuotes() => QuotesProvider().tellMe();
}