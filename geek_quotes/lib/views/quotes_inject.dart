// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:geek_quotes/viewmodel/quote_view_model.dart';
// import 'package:provider/provider.dart';


// class Happening extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return CarouselSlider.builder(
//       itemCount: this.kwe.length,
//       itemBuilder: (context, index){
//         return Container(
//           height: 280, 
//           width: 280,
//           alignment: Alignment.center, 
//           decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), 
//           color: Colors.green[300],
//           ),
//           child: Column(
//             children: <Widget>[
//               Text(''),
//             ],
//           ),
//         );
//       },
//       options: null,
//     );
//   }
// }


// // class Doing extends StatefulWidget {
// //   @override
// //   _DoingState createState() => _DoingState();
// // }

// // class _DoingState extends State<Doing> {


// //   // @override
// //   // void initState() {
// //   //   super.initState();
// //   //   Provider.of<QuoteViewModel>(context, listen: false).dquotes();
// //   // }

// //   @override
// //   Widget build(BuildContext context) {
    
// //     // final kevwe = Provider.of<QuoteViewModel>(context);
    
// //     return Container(
// //       child: Column(
// //         children: <Widget>[
// //           Expanded(child: Happening(kwe: kevwe.qvModel),)
// //         ],
// //       ),
// //     );
// //   }
// // }