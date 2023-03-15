import 'package:flutter/material.dart';

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints sizes) {
                if (sizes.maxWidth < 500) {
                    return const ListData();
                }
                return const GridData();
            }
)
    );
  }
}

 class ListData extends StatelessWidget {
        const ListData({super.key});
        @override
        Widget build(BuildContext context) {
            return ListView.builder(
                itemCount: 100,
                itemBuilder: (context, id) {
                    return ListTile(
                        leading: const Icon(Icons.add_box),
                        title: Text("Item $id"),
                    );
} );
} }

  class GridData extends StatelessWidget {
    const GridData({super.key});
        @override
        Widget build(BuildContext context) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
             mainAxisSize: MainAxisSize.min,
             // crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                //your widgets here...
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Hello"),
                ),

                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 400,
                    child: TextField(decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      //hintText: 'Enter a search term',
                    ),),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Hello"),
                ),



                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 400,
                    child: TextField(decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      //hintText: 'Enter a search term',
                    ),),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Hello"),
                ),


                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 400,
                    child: TextField(decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      //hintText: 'Enter a search term',
                    ),),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Hello"),
                ),

                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 400,
                    child: TextField
                      (decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      //hintText: 'Enter a search term',
                    ),
                    ),
                  ),
                ),

                ElevatedButton(
                  //style: ElevatedButton.styleFrom(onSurface: Colors.red),
                  onPressed: null,
                  child: Text('ElevatedButton with custom disabled colors'),
                )

              ],
            ),
          );

            // children: List.generate(100, (index) {
            //   return Center(
            //     child: ListTile(
            //       leading: const Icon(Icons.add_box),
            //      title: Text("Item $index"),
            //     ),
            //   );
            // })



}
}