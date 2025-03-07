// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:hive_flutter/adapters.dart';
// import 'package:provider/provider.dart';
// import 'package:tsv_count_app/Boxes/boxes.dart';
// import 'package:tsv_count_app/Provider/Home_Screen_Provider.dart';
// import 'package:tsv_count_app/models/counter_model.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<HomeScreenProvider>(//* <-- Provider Use
//         builder: (context, provider, child) {
//       return SafeArea(
//         child: ValueListenableBuilder<Box<CounterModel>>(
//           valueListenable: Boxes.getData().listenable(),
//           builder: (context, box, _) {
//             List<CounterModel> data = box.values.toList().cast<CounterModel>();
//             //var data = box.values.toList().cast<NotesModel>();

//             data = data.where((i) => i.selected == true).toList();
//             return data.isEmpty
//                 ? SizedBox()
//                 : Container(
//                     child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       SizedBox(
//                         height: MediaQuery.of(context).size.height * 0.02,
//                       ),
//                       Center(
//                         child: Text(
//                           // provider.counter.toString(),
//                           data[0].counter.toString(),
//                           style: TextStyle(fontSize: 130),
//                         ),
//                       ),
//                       Container(
//                         height: MediaQuery.of(context).size.height * 0.15,
//                         child: Center(
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 20),
//                             child: SingleChildScrollView(
//                               child: Text(
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                       fontSize: 27,
//                                       fontWeight: FontWeight.w500),
//                                   data[0].description.toString()
//                                   // "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy"
//                                   ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: MediaQuery.of(context).size.height * 0.17,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           FloatingActionButton(
//                               onPressed: () async {
//                                 if (provider.counter != 0) {
//                                   provider.decrementCounter();
//                                   data[0].counter = provider.counter;
//                                   await data[0].save();
//                                 }
//                               },
//                               child: Icon(Icons.remove),
//                               backgroundColor: Colors.red,
//                               elevation: 0,
//                               shape: CircleBorder(
//                                   side:
//                                       BorderSide(color: Colors.red, width: 1))),
//                           FloatingActionButton(
//                               onPressed: () async {
//                                 provider.incrementCounter();
//                                 data[0].counter = provider.counter;
//                                 await data[0].save();

//                                 // if (provider.counter != 10) {
//                                 //   provider.incrementCounter();
//                                 //   data[0].counter = provider.counter;
//                                 //   await data[0].save();
//                                 // }
//                               },
//                               child: Icon(Icons.add),
//                               backgroundColor: Colors.green,
//                               elevation: 0,
//                               shape: CircleBorder(
//                                   side: BorderSide(
//                                       color: Colors.green, width: 1))),
//                         ],
//                       ),
//                       SizedBox(
//                         height: MediaQuery.of(context).size.height * 0.1,
//                       ),
//                       Material(
//                         color: Color(0xff030637),
//                         borderRadius: BorderRadius.circular(10),
//                         elevation: 0,
//                         child: InkWell(
//                           onTap: () async {
//                             provider.clearCounter();
//                             log("Calling");
//                             data[0].counter = provider.counter;
//                             await data[0].save();
//                           },
//                           child: Container(
//                             height: 60,
//                             width: 180,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10)),
//                             child: Center(
//                                 child: Text(
//                               "Clear",
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 24,
//                                   fontWeight: FontWeight.bold),
//                             )),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ));
//           },
//         ), //* ValueListenableBuilder End
//       );
//     });
//   }
// }
