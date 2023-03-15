import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];
final themeMode = ValueNotifier(2);

class ResponsiveCarousel extends StatelessWidget {
  const ResponsiveCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints sizes) {
              if (sizes.maxWidth < 500) {
                return const CarouselDemo();
              }
              return const MultipleItemDemo();
            }
        )
    );
  }
}

class CarouselDemo extends StatelessWidget {
  const CarouselDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (context, value, g) {
        return MaterialApp(
          initialRoute: '/',
          darkTheme: ThemeData.dark(),
          themeMode: ThemeMode.values.toList()[value],
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (ctx) => const ComplicatedImageDemo(),

            '/complicated': (ctx) => const ComplicatedImageDemo(),

          },
        );
      },
      valueListenable: themeMode,
    );
  }
}


final List<Widget> imageSliders = imgList
    .map((item) => Container(
      margin: const EdgeInsets.all(5.0),
      child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              Image.network(item, fit: BoxFit.cover, width: 1000.0),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  // padding: const EdgeInsets.symmetric(
                  //     vertical: 10.0, horizontal: 20.0),
                  // child: Text(
                  //   'No. ${imgList.indexOf(item)} image',
                  //   style: const TextStyle(
                  //     color: Colors.white,
                  //     fontSize: 20.0,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                ),
              ),
            ],
          )),
    ))
    .toList();

class ComplicatedImageDemo extends StatelessWidget {
  const ComplicatedImageDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Complicated image slider demo')),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
      CarouselSlider(
      options: CarouselOptions(
      autoPlay: true,
        aspectRatio: 2.0,
        enlargeCenterPage: true,height: 300,
      ),
      items: imageSliders,
    ),

          Expanded(
            child: GridView.custom(gridDelegate: SliverStairedGridDelegate(
              crossAxisSpacing: 48,
              mainAxisSpacing: 24,
              startCrossAxisDirectionReversed: true,
              pattern: [
                const StairedGridTile(0.5, 1),
                const StairedGridTile(0.5, 3 / 4),
                const StairedGridTile(1.0, 10 / 4),
              ],
            ), childrenDelegate: SliverChildBuilderDelegate(
                  (context, index) {
                return ClipRRect(
                  child: Image.network(
                      "https://source.unsplash.com/random?sig=$index"
                  ),

                );
              },
            ),),
          ),
        ],
      ),
    );


  }
}


class MultipleItemDemo extends StatelessWidget {
  const MultipleItemDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Multiple item in one slide demo')),
      body: Column(
        children: [
          CarouselSlider.builder(
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 2.0,
              enlargeCenterPage: false,
              viewportFraction: 1,height: 400,
            ),
            itemCount: (imgList.length / 2).round(),
            itemBuilder: (context, index, realIdx) {
              final int first = index * 2;
              final int second = first + 1;
              final int third = second + 1;
              return Row(
                children: [first, second].map((idx) {
                  return Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      child: Image.network(imgList[idx], fit: BoxFit.cover),
                    ),
                  );
                }).toList(),
              );
            },
          ),

          Expanded(
            child: GridView.custom(
                gridDelegate: SliverWovenGridDelegate.count(
              crossAxisCount: 4,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              pattern: [
                const WovenGridTile(1),
                const WovenGridTile(
                  5 / 7,
                  crossAxisRatio: 0.9,
                  alignment: AlignmentDirectional.centerEnd,
                ),
              ],
            ), childrenDelegate: SliverChildBuilderDelegate(
                  (context, index) {
                return ClipRRect(
                  child: Image.network(
                      "https://source.unsplash.com/random?sig=$index"
                  ),

                );
              },
            ),),
          )
        ],
      ),
    );
  }
}

