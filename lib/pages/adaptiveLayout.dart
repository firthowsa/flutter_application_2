// import 'package:flutter/material.dart';
// import 'package:flutter_application_2/src/people.dart';
// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: LayoutBuilder(
//         builder: (context, constraints) {
//           if (constraints.maxWidth > 600) {
//             return const WideLayout();
//           } else {
//             return const NarrowLayout();
//           }
//         },
//       ),
//     );
//   }
// }

// class WideLayout extends StatefulWidget {
//   const WideLayout({super.key});

//   @override
//   _WideLayoutState createState() => _WideLayoutState();
// }

// class _WideLayoutState extends State<WideLayout> {
  
//   Person _person;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//           flex: 2,
//           child: PeopleList(
//               onPersonTap: (person) => setState(() => _person = person)),
//         ),
//         Expanded(
//           flex: 3,
//           child: _person == null ? const Placeholder() : PersonDetail(_person),
//         ),
//       ],
//     );
//   }
// }

// class NarrowLayout extends StatelessWidget {
//   const NarrowLayout({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return PeopleList(
//       onPersonTap: (person) => Navigator.of(context).push(
//         MaterialPageRoute(
//           builder: (context) => Scaffold(
//             appBar: AppBar(),
//             body: PersonDetail(person),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class PeopleList extends StatelessWidget {
//   final void Function(Person) onPersonTap;

//   const PeopleList({super.key, required this.onPersonTap});

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: <Widget>[
//         for (var person in people)
//           ListTile(
//             leading: Image.network(person.picture),
//             title: Text(person.name),
//             onTap: () => onPersonTap(person),
//           ),
//       ],
//     );
//   }
// }

// class PersonDetail extends StatelessWidget {
//   final Person person;

//   const PersonDetail(this.person, {super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(person.name),
//           Text(person.phone),
//         ],
//       ),
//     );
//   }
// }
