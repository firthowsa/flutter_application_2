import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/carousel.dart';
import 'package:flutter_application_2/pages/layoutBuilder.dart';
import 'package:flutter_application_2/pages/layoutBuilderDemo.dart';
import 'package:flutter_application_2/pages/stairedLayout.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

void main() {
  runApp(const MyApp());
}
  
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      // builder: (context, widget) => ResponsiveWrapper.builder(
      //   ClampingScrollWrapper.builder(context, widget!),
      //   breakpoints: const [
      //     ResponsiveBreakpoint.resize(350, name: MOBILE),
      //     ResponsiveBreakpoint.autoScale(600, name: TABLET),
      //     ResponsiveBreakpoint.resize(800, name: DESKTOP),
      //     ResponsiveBreakpoint.autoScale(1700, name: 'XL'),
      //   ],
      // ),
      debugShowCheckedModeBanner: false,
        
      //Title of an App
      title: 'GFG APP',
        
      //Theme of an App
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      darkTheme: ThemeData.dark(),
        
     // First Screen of App
      home:const CarouselDemo(),
    );
  }
}

// Widget stairedLayout(BuildContext context){
//   return
//     GridView.custom(
//   gridDelegate: SliverStairedGridDelegate(
//     crossAxisSpacing: 48,
//     mainAxisSpacing: 24,
//     startCrossAxisDirectionReversed: true,
//     pattern: [
//       const StairedGridTile(0.5, 1),
//       const StairedGridTile(0.5, 3 / 4),
//       const StairedGridTile(1.0, 10 / 4),
//     ],
//   ),
//   childrenDelegate: SliverChildBuilderDelegate(
//     (context, index) {
//       return ClipRRect(
//         child: Image.network(
//           "https://source.unsplash.com/random?sig=$index"
//           ),
//
//       );
//     },
//   ),
// );
//
// }

