// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/adapters.dart';
// import 'package:provider/provider.dart';
// import 'package:tsv_count_app/Boxes/boxes.dart';
// import 'package:tsv_count_app/Provider/Home_Screen_Provider.dart';
// import 'package:tsv_count_app/models/counter_model.dart';

// class ListScreen extends StatefulWidget {
//   const ListScreen({super.key});

//   @override
//   State<ListScreen> createState() => _ListScreenState();
// }

// class _ListScreenState extends State<ListScreen> {
//   final descriptionController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: ValueListenableBuilder<Box<NotesModel>>(
//           valueListenable: Boxes.getData().listenable(),
//           builder: (context, box, _) {
//             List<NotesModel> data = box.values.toList().cast<NotesModel>();
//             //var data = box.values.toList().cast<NotesModel>();

//             return ListView.builder(
//               reverse: true,
//               shrinkWrap: true,
//               itemCount: box.length,
//               itemBuilder: (context, index) {
//                 return Container(
//                     child: Column(
//                   children: [
//                     Container(
//                       height: 60,
//                       margin: EdgeInsets.all(15),
//                       decoration: BoxDecoration(
//                           color: Color(0xff240A34),
//                           borderRadius: BorderRadius.circular(10)),
//                       child: Center(
//                         child: ListTile(
//                           leading: Text(
//                             data[index].counter.toString(),
//                             style: TextStyle(fontSize: 25, color: Colors.white),
//                           ),
//                           title: SingleChildScrollView(
//                             scrollDirection: Axis.horizontal,
//                             child: Text(data[index].description.toString(),
//                                 style: TextStyle(
//                                     fontSize: 20, color: Colors.white),
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis),
//                           ),
//                           trailing: IconButton(
//                               onPressed: () async {
//                                 {
//                                   for (var i = 0; i < data.length; i++) {
//                                     if (data[i].selected == true) {
//                                       data[i].selected = false;
//                                       await data[i].save();
//                                     }
//                                   }
//                                 }
//                                 data[index].selected = true;
//                                 await data[index].save();

//                                 Provider.of<HomeScreenProvider>(context,
//                                         listen: false)
//                                     .setCounter(data[index].counter);
//                               },
//                               icon: data[index].selected
//                                   ? Icon(
//                                       Icons.done,
//                                       color: Colors.green,
//                                     )
//                                   : Icon(
//                                       Icons.add,
//                                       color: Colors.white,
//                                     )),
//                           onLongPress: () {
//                             _editDialog(data[index], data[index].description);
//                           },
//                         ),
//                       ),
//                     )
//                   ],
//                 ));
//               },
//             ); //* ListView.builder End
//           },
//         ), //* ValueListenableBuilder End
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             _showdMydialog();
//           },
//           child: Icon(
//             Icons.add,
//             color: Colors.white,
//           ),
//           backgroundColor: Color(0xff240A34),
//         ),
//       ),
//     );
//   }

// //TODO Create delete Function
//   void delete(NotesModel notesModel) async {
//     await notesModel.delete();

//     // Boxes.getData().clear();  //* <-- ALl Data deleted
//   }

// //TODO Create EditDialog Function
//   Future<void> _editDialog(NotesModel notesModel, String description) {
//     descriptionController.text = description;

//     return showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text("Edit Counting Event"),
//           content: SingleChildScrollView(
//             child: Column(
//               children: [
//                 TextFormField(
//                   controller: descriptionController,
//                   decoration: InputDecoration(
//                       hintText: "Enter description",
//                       border: OutlineInputBorder()),
//                 )
//               ],
//             ),
//           ),
//           actions: [
//             TextButton(
//                 onPressed: () {
//                   delete(notesModel);
//                   Navigator.pop(context);
//                 },
//                 child: Icon(
//                   Icons.delete,
//                   color: Colors.red,
//                 )),
//             TextButton(
//                 onPressed: () {
//                   descriptionController.clear();
//                   Navigator.pop(context);
//                 },
//                 child: Text("Cancel")),
//             TextButton(
//                 onPressed: () async {
//                   notesModel.description =
//                       descriptionController.text.toString();

//                   await notesModel.save();

//                   descriptionController.clear();
//                   Navigator.pop(context);
//                 },
//                 child: Text("Edit"))
//           ],
//         );
//       },
//     );
//   }

//   //TODO Create Data Add ShowDialog Function
//   Future<void> _showdMydialog() {
//     return showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text("Add Counting Event"),
//           content: SingleChildScrollView(
//             child: Column(
//               children: [
//                 TextFormField(
//                   controller: descriptionController,
//                   decoration: InputDecoration(
//                       hintText: "Enter description",
//                       border: OutlineInputBorder()),
//                 )
//               ],
//             ),
//           ),
//           actions: [
//             TextButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 child: Text("Cancel")),
//             TextButton(
//                 onPressed: () {
//                   final data = NotesModel(
//                       description: descriptionController.text,
//                       counter: 0,
//                       selected: false);

//                   final box = Boxes.getData();

//                   box.add(data);

//                   print(box);

//                   data.save();

//                   descriptionController.clear();
//                   Navigator.pop(context);
//                 },
//                 child: Text("Add"))
//           ],
//         );
//       },
//     );
//   }
// }
