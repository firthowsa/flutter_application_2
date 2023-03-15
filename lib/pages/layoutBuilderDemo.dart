import 'package:flutter/material.dart';
//import 'package:flutter_layout_builder_demo/themes/device_size.dart';

class LayoutBuilderDemo extends StatefulWidget {
  const LayoutBuilderDemo({super.key});

  @override
  _LayoutBuilderDemoState createState() => _LayoutBuilderDemoState();
}

class _LayoutBuilderDemoState extends State<LayoutBuilderDemo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('LayoutBuilder Demo'),
          centerTitle: true,
        ),
        body: Container(
          /// Giving dimensions to parent Container
          /// using MediaQuery
          //height: DeviceSize.height(context),
         // width: DeviceSize.width(context),
         alignment: Alignment.center,

          child: LayoutBuilder(
            builder: (BuildContext ctx, BoxConstraints constraints) {
              // if the screen width >= 480 i.e Wide Screen
              if (constraints.maxWidth >= 480) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding:const EdgeInsets.symmetric(horizontal: 8),
                      alignment: Alignment.center,
                      height: constraints.maxHeight * 0.3,
                      margin: const EdgeInsets.fromLTRB(10.0, 0.0,10.0,0.0),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: const Text(
                        'Left Wide Screen',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      padding:const EdgeInsets.symmetric(horizontal: 8),
                      alignment: Alignment.center,
                      height: constraints.maxHeight * 0.3,
                      margin: const EdgeInsets.fromLTRB(10.0, 0.0,10.0,0.0),
                      decoration: const BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: const Text(
                        'Right Wide Screen',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                );

                // If screen size is < 480
              } else {
                return Container(
                  alignment: Alignment.center,
                  height: constraints.maxHeight * 0.3,
                  margin: const EdgeInsets.fromLTRB(10.0, 0.0,10.0,0.0),
                  decoration: const BoxDecoration(
                    color: Colors.cyan,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: const Text(
                    'Normal Screen',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}