import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


class stairedLayout extends StatelessWidget {
  const stairedLayout({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
      GridView.custom(
        gridDelegate: SliverStairedGridDelegate(
          crossAxisSpacing: 48,
          mainAxisSpacing: 24,
          startCrossAxisDirectionReversed: true,
          pattern: [
            const StairedGridTile(0.5, 1),
            const StairedGridTile(0.5, 3 / 4),
            const StairedGridTile(1.0, 10 / 4),
          ],
        ),
        childrenDelegate: SliverChildBuilderDelegate(
              (context, index) {
            return ClipRRect(
              child: Image.network(
                  "https://source.unsplash.com/random?sig=$index"
              ),

            );
          },
        ),
      );
    throw UnimplementedError();
  }



}