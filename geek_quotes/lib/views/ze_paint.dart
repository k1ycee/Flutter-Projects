import 'package:flutter/material.dart';
import 'package:geek_quotes/viewmodel/quote_view_model.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:carousel_slider/carousel_slider.dart';


class ZePainting extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
          return ViewModelProvider<QuoteViewModel>.withConsumer(
            viewModelBuilder: () => QuoteViewModel(),
            onModelReady: (model) => model.dquotes(),
            builder:(context,model,_) => SafeArea(
            child: Scaffold(
              body: Container(
              color: Colors.white,
              child: CustomPaint(
                painter: WillPaint(),
                child: Column(
                    children: <Widget>[
                      SizedBox(height: 40,),
                      Container(child: Text('Programming Quotes', style: TextStyle(color: Colors.white, fontSize: 28),),),
                      SizedBox(height: 150,),
                      Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                          itemCount: model.qvModel.length,
                          itemBuilder: (context,index) => Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: FittedBox(
                              fit: BoxFit.contain,
                                child: SizedBox(
                                height: 250, 
                                width: 200,
                                child: GestureDetector(
                                  onTap: (){},
                                    child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.green[300]),
                                    child: Column(
                                    children: <Widget>[
                                      Text('"${model.qvModel[index].quote}"', style: TextStyle(color: Colors.white, fontSize: 14, fontStyle: FontStyle.italic),overflow: TextOverflow.fade,maxLines: 10,),
                                      SizedBox(height: 10,),
                                      Row(
                                        children: <Widget>[
                                          Text('${model.qvModel[index].author}', style: TextStyle(color: Colors.white, fontSize: 10),overflow: TextOverflow.ellipsis)
                                      ],)
                                      ],),
                                  ),
                                ),),
                            ),
                          ),
                        ),
                      ) 
                    ],),
                ),
              ),
            ),
      ),
    );
  }
}





class WillPaint extends CustomPainter{


  @override 
  void paint(Canvas canvas, Size size){
    final paint = Paint()
    ..color = Colors.green[300]    
    ..style = PaintingStyle.fill
    ..strokeWidth = 3.0;

    final path = Path();
    // final dpath = Path();

    path.moveTo(0, size.width * 0.25);

    path.quadraticBezierTo(size.width / 2, size.height /2, size.width, size.height /4);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);


    // dpath.moveTo(0, size.height * 0.9167);
    // dpath.quadraticBezierTo(size.width * 0.25, size.height * 0.875,
    //     size.width * 0.5, size.height * 0.9167);
    // dpath.quadraticBezierTo(size.width * 0.75, size.height * 0.9584,
    //     size.width * 1.0, size.height * 0.9167);
    // dpath.lineTo(size.width, size.height);
    // dpath.lineTo(0, size.height);

    // canvas.drawPath(dpath, paint);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(WillPaint oldDelegate) => true;
}