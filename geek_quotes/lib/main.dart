import 'package:flutter/material.dart';
import 'package:geek_quotes/views/ze_paint.dart';
import 'package:geek_quotes/viewmodel/quote_view_model.dart';
import 'package:provider/provider.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  final quete;
  MyApp({this.quete});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ChangeNotifierProvider(
      create: (context) => QuoteViewModel(),
      child: ZePainting(),
      )
    );
  }
}

