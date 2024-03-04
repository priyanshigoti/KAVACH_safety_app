// import 'package:flutter/material.dart';
// import 'package:kavach_project/presentation/E-learning/videoList.dart';
//
// class desc_eLearning extends StatefulWidget {
//   const desc_eLearning({super.key});
//
//   @override
//   State<desc_eLearning> createState() => _desc_eLearningState();
// }
//
// class _desc_eLearningState extends State<desc_eLearning> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: const Text(
//       //     'E-Learning for Safety Awareness',
//       //     style: TextStyle(fontSize: 18),
//       //   ),
//       // ),
//       body: SingleChildScrollView(
//         child: Stack(
//           children: [
//             Container(
//               color: Color(0xFF4C2659),
//               width: double.infinity,
//               height: MediaQuery.of(context).size.height * 0.9,
//             ),
//             Positioned(
//               top: MediaQuery.of(context).size.height * 0.10,
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.vertical,
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(20),
//                       topRight: Radius.circular(20),
//                     ),
//                   ),
//                   width: MediaQuery.of(context).size.width,
//                   height: MediaQuery.of(context).size.height * 0.88 - 50,
//                   child:
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                           alignment: Alignment.center,
//                           height: 250,
//                           child: Image(image: AssetImage('assets/4955888-removebg-preview.png'))),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 18,left: 18,right: 18),
//                         child: Text(
//                           "Title",
//                           style: TextStyle(fontSize: 20, color: Color(0xFF4C2559),fontWeight: FontWeight.w700,fontFamily: 'kalam'),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 18,right: 18),
//                         child: Text(
//                           "Awareness for Women's Safety",
//                           style: TextStyle(fontSize: 16, color: Colors.black),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 18,left: 18,right: 18),
//                         child: Text(
//                           "Description",
//                           style: TextStyle(fontSize: 20, color: Color(0xFF4C2559),fontWeight: FontWeight.w700,fontFamily: 'kalam'),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 18,right: 18),
//                         child: Text(
//                           "An E-Learing module to create the Safety Awareness for Women.",
//                           style: TextStyle(fontSize: 16, color: Colors.black),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 70,
//                       ),
//                       Center(
//                           child: ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Color(0xFF4C2559),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.04),
//                                 ),
//                                 minimumSize: Size(
//                                   MediaQuery.of(context).size.width * 0.60,
//                                   MediaQuery.of(context).size.height * 0.06,
//                                 ),
//                               ),
//
//                               onPressed: () {
//                                 Navigator.push(context,
//                                     MaterialPageRoute(builder: (Builder) => videoList()));
//                               },
//                               child: Text("Start Video")))
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:kavach_project/presentation/E-learning/videoList.dart';

class desc_eLearning extends StatefulWidget {
  const desc_eLearning({super.key});

  @override
  State<desc_eLearning> createState() => _desc_eLearningState();
}

class _desc_eLearningState extends State<desc_eLearning> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              color: Color(0xFF4C2659),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.9,
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.05, // Adjust position as needed
              left: 15,
              right: 0,
              child: Text(
                'E-Learning',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.12,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.88 - 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 250,
                        child: Image(image: AssetImage('assets/4955888-removebg-preview.png')),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 24, left: 18, right: 18),
                        child: Text(
                          "Title",
                          style: TextStyle(fontSize: 20, color: Color(0xFF4C2559), fontWeight: FontWeight.w700,),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 18, right: 18),
                        child: Text(
                          "SAFE - Awareness for Women's Safety",
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 18, right: 18),
                        child: Text(
                          "Description",
                          style: TextStyle(fontSize: 20, color: Color(0xFF4C2559), fontWeight: FontWeight.w700,),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5,left: 18, right: 18),
                        child: Text(
                          "An E-Learing module to create the Safety Awareness for Women and guide them how to handle such a sitution calmy and smartly.",
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        height: 70,
                      ),
                      Center(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF4C2559),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.04),
                                ),
                                minimumSize: Size(
                                  MediaQuery.of(context).size.width * 0.60,
                                  MediaQuery.of(context).size.height * 0.06,
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (Builder) => videoList()));
                              },
                              child: Text("See chapters",style: TextStyle(fontSize: 15),)))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
