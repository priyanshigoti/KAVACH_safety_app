//
//
//
// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Helpline Numbers',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Call_helpline_screen(),
//     );
//   }
// }
//
//
// class Call_helpline_screen extends StatelessWidget {
//   const Call_helpline_screen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//
//     final List<CallData> helplines = [
//       CallData(
//         number: '100',
//         name: 'Police',
//         image: 'assets/police.png',
//         color: Colors.green.shade100,
//       ),
//       CallData(
//         number: '101',
//         name: 'Fire Department',
//         image: 'assets/fire-truck.png',
//         color: Colors.blue.shade100,
//       ),
//       CallData(
//         number: '102',
//         name: 'Ambulance',
//         image: 'assets/ambulance.png',
//         color: Colors.orange.shade100,
//       ),
//       CallData(
//         number: '181',
//         name: 'Women(Domestic Abuse)',
//         image: 'assets/women.png',
//         color: Colors.brown.shade100,
//       ),
//       CallData(
//         number: '1098',
//         name: 'Child Helpline',
//         image: 'assets/children.png',
//         color: Colors.pink.shade100,
//       ),
//       CallData(
//         number: '104',
//         name: 'National Health',
//         image: 'assets/healthcare (1).png',
//         color: Colors.deepOrange.shade100,
//       ),
//       CallData(
//         number: '108',
//         name: 'Road Accident',
//         image: 'assets/accident.png',
//         color: Colors.grey.shade100,
//       ),
//       CallData(
//         number: '1800-180-1104',
//         name: 'National Helpiline',
//         image: 'assets/phone.png',
//         color: Colors.teal.shade100,
//       ),
//       CallData(
//         number: '911',
//         name: 'Emergency',
//         image: 'assets/log6.png',
//         color: Colors.deepPurple.shade100,
//       ),
//
//       // Add more helpline numbers as needed
//     ];
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Emergency Helplines'),
//       ),
//       body: ListView.builder(
//         itemCount: helplines.length,
//         itemBuilder: (context, index) {
//           return HelplineCard(helplineData: helplines[index]);
//         },
//       ),
//     );
//   }
// }
//
//
// class HelplineCard extends StatelessWidget {
//   final CallData helplineData;
//
//   const HelplineCard({Key? key, required this.helplineData}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(15.0),
//       child: Container(
//         decoration: BoxDecoration(
//           color: helplineData.color,
//           borderRadius: BorderRadius.circular(15),
//         ),
//         padding: EdgeInsets.only(top: 25,left: 17,right: 17,bottom: 25),
//         child: Row(
//           children: [
//             Image.asset(
//               helplineData.image,
//               width: 60,
//               height: 50,
//             ),
//          //   SizedBox(width: 14),
//             Padding(
//               padding: const EdgeInsets.all(10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     helplineData.number,
//                     style: TextStyle(color: Colors.black, fontSize: 18),
//                   ),
//                   Text(
//                     helplineData.name,
//                     style: TextStyle(color: Colors.black, fontSize: 15),
//                   ),
//                 ],
//               ),
//             ),
//             Spacer(),
//             IconButton(
//               icon: Icon(Icons.phone, color: Colors.black,size: 30,),
//               onPressed: () {
//                 _makePhoneCall(helplineData.number);
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _makePhoneCall(String number) async {
//     if (await canLaunch('tel:$number')) {
//       await launch('tel:$number');
//     } else {
//       throw 'Could not launch $number';
//     }
//   }
// }
//
// class CallData {
//   final String name;
//   final String number;
//   final String image;
//   final Color color;
//
//   CallData({
//     required this.name,
//     required this.number,
//     required this.image,
//     required this.color,
//   });
// }
