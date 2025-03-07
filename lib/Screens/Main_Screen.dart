// import 'package:flutter/material.dart';
// import 'package:tsv_count_app/Screens/Home_Screen.dart';
// import 'package:tsv_count_app/Screens/List_Screen.dart';

// class MainScreen extends StatefulWidget {
//   const MainScreen({super.key});

//   @override
//   State<MainScreen> createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   int _currentIndex = 0;

//   static List<Widget> _widgetOptions = <Widget>[
//     //* <-- First Create ( List ) <-- iska kaam hai Pages ko display karta hai
//     HomeScreen(),
//     ListScreen()
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: _widgetOptions.elementAt(
//             _currentIndex), //* <-- Call List Widget  (Widget Name This --> _widgetOptions )

//         bottomNavigationBar: BottomNavigationBar(
//           unselectedLabelStyle:
//               const TextStyle(color: Colors.black, fontSize: 14),
//               selectedLabelStyle: TextStyle(color: Colors.pink, fontSize: 14),
//               selectedItemColor: Colors.pink,
//           // backgroundColor: const Color(0xFF084A76),
//           // fixedColor: Colors.white,
//           currentIndex: _currentIndex,
//           onTap: (value) {
//             setState(() {
//               _currentIndex = value;
//             });
//           },
//           items: [
//             BottomNavigationBarItem(
//                 icon: Icon(
//                   Icons.home_outlined,
//                 ),
//                 activeIcon: Icon(Icons.home),
//                 label: 'Home'),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.list_outlined),
//                 activeIcon: Icon(Icons.list),
//                 label: 'List'
                
//                 )
//           ],
//         ));
//   }
// }
