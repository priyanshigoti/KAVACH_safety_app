// // feedback_screen.dart
//
// import 'package:flutter/material.dart';
// import 'package:kavach_project/presentation/Feedback_screen/provider/Feedback_screen_provider.dart';
// import 'package:provider/provider.dart';
//
//
// import 'models/Feedback_screen_model.dart';
//
// class FeedBackScreen extends StatefulWidget {
//   const FeedBackScreen({Key? key}) : super(key: key);
//
//   @override
//   _FeedBackScreenState createState() => _FeedBackScreenState();
// }
//
// class _FeedBackScreenState extends State<FeedBackScreen> {
//   double _feedbackValue = 0.0;
//   final feedbackcontroller = TextEditingController();
//   final emailcontroller = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Stack(
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: EdgeInsets.all(15.0),
//                   child: Text(
//                     "Feedback",
//                     style: TextStyle(
//                       fontSize: 20,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Container(
//               color: Color(0xFF4C2659),
//               width: double.infinity,
//               height: 700,
//             ),
//             Positioned(
//               top: 90,
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
//                   width: 392.5,
//                   height: MediaQuery.of(context).size.height - 50,
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(15.0),
//                         child: Text(
//                           'How do you feel using our App?',
//                           style: TextStyle(
//                             fontSize: 15,
//                             color: Color(0xFF4C2659),
//                           ),
//                         ),
//                       ),
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           // Your smiley image and slider widget
//                         ],
//                       ),
//                       SizedBox(height: 20,),
//                       Row(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(left: 20),
//                             child: Text(
//                               "Tell us more",
//                               style: TextStyle(
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(20.0),
//                         child: TextFormField(
//                           style: TextStyle(color: Colors.black, fontSize: 17),
//                           controller: feedbackcontroller,
//                           maxLines: 4,
//                           maxLength: 200,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Row(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(left: 20),
//                             child: Text(
//                               "Email",
//                               style: TextStyle(
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
//                         child: TextFormField(
//                           style: TextStyle(color: Colors.black, fontSize: 17),
//                           controller: emailcontroller,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 20,),
//                       ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.purple.shade100,
//                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
//                           padding: EdgeInsets.symmetric(horizontal: 15 * 5.0, vertical: 9),
//                         ),
//                         onPressed: () {
//                           _submitFeedback(context);
//                         },
//                         child: Text('Send', style: TextStyle(fontSize: 15, color: Colors.black),),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   String _getSmileyImage() {
//     if (_feedbackValue <= -0.33) {
//       return 'assets/happface.png';
//     } else if (_feedbackValue <= 0.33) {
//       return 'assets/confusedface.png';
//     } else {
//       return 'assets/sadface.png';
//     }
//   }
//
//   void _submitFeedback(BuildContext context) {
//     final feedbackProvider = Provider.of<FeedbackProvider>(context, listen: false);
//     final feedback = feedbackcontroller.text;
//     final email = emailcontroller.text;
//
//     if (feedback.isNotEmpty && email.isNotEmpty) {
//       feedbackProvider.setFeedback(FeedbackModel(feedback: feedback, email: email));
//       // You can handle further actions here like showing a success message or navigating to another screen.
//     }
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kavach_project/presentation/Feedback_screen/provider/Feedback_screen_provider.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:provider/provider.dart';

import 'models/Feedback_screen_model.dart';

class FeedBackScreen extends StatefulWidget {
  const FeedBackScreen({Key? key}) : super(key: key);

  @override
  _FeedBackScreenState createState() => _FeedBackScreenState();
}

class _FeedBackScreenState extends State<FeedBackScreen> {
  double _feedbackValue = 0.0;
  final feedbackcontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;



  void _addfeedback() async {
    String email = emailcontroller.text;
    String feedback = feedbackcontroller.text;

    // Validate if email and feedback are not empty
    if (email.isNotEmpty || feedback.isNotEmpty) {
      // Check if the email is valid
      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
        _showErrorDialog('Invalid Email', 'Please enter a valid email address.');
        return;
      }

      await _firestore.collection('feedback').add({
        'email': email,
        'feedback': feedback,
      });

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Feedback Added!'),
            content: Text('Thank you for your feedback.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK',style: TextStyle(color: Color(0xFF4C2559)),),
              ),
            ],
          );
        },
      );

      // Navigator.push(context, MaterialPageRoute(builder: (context)=> user_feedback()));
    } else {
      // Show error dialog if fields are empty
      _showErrorDialog('Fields Empty', 'Please fill in both email and feedback fields.');
    }
  }

  void _showErrorDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    "Feedback",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              color: Color(0xFF4C2659),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.9,
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.10,
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
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          'How do you feel using our App?',
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFF4C2659),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            _getSmileyImage(),
                            height: 80.0,
                            width: 80.0,
                          ),
                          Slider(
                            value: _feedbackValue,
                            min: -1.0,
                            max: 1.0,
                            onChanged: (newValue) {
                              setState(() {
                                _feedbackValue = newValue;
                              });
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Happy'),
                                Text('Confused'),
                                Text('Sad'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              "Tell us more",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextFormField(
                          style: TextStyle(color: Colors.black, fontSize: 17),
                          controller: feedbackcontroller,
                          maxLines: 4,
                          maxLength: 200,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              "Email",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
                        child: TextFormField(
                          style: TextStyle(color: Colors.black, fontSize: 17),
                          controller: emailcontroller,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.04,),
                      ElevatedButton(
                        onPressed: _addfeedback,
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
                        child: Text(
                          "SEND",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                      ),
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

  String _getSmileyImage() {
    if (_feedbackValue <= -0.33) {
      return 'assets/happface.png';
    } else if (_feedbackValue <= 0.33) {
      return 'assets/confusedface.png';
    } else {
      return 'assets/sadface.png';
    }
  }
}
