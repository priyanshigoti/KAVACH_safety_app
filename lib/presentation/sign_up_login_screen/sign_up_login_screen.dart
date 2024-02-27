

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:kavach_project/localization/app_localization.dart';
//
// import '../../core/app_export.dart';
// import '../../theme/theme_helper.dart';
// import '../Sign_up_screen/Sign_up_screen.dart';
// import '../home_page/home_page.dart';
// import 'provider/sign_up_login_provider.dart';
//
// class SignUpLoginScreen extends StatefulWidget {
//   const SignUpLoginScreen({Key? key})
//       : super(
//     key: key,
//   );
//   @override
//   SignUpLoginScreenState createState() => SignUpLoginScreenState();
//   static Widget builder(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => SignUpLoginProvider(),
//       child: SignUpLoginScreen(),
//     );
//   }
// }
//
// class SignUpLoginScreenState extends State<SignUpLoginScreen> {
//   //String email="", password="";
//   final emailController=TextEditingController();
//   final passwordController=TextEditingController();
//   final _formkey=GlobalKey<FormState>();
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   final FirebaseAuth _auth=FirebaseAuth.instance;
//
//
//
//
//   void login() {
//     if (_formkey.currentState!.validate()) {
//       FirebaseAuth.instance
//           .signInWithEmailAndPassword(
//         email: emailController.text.trim(),
//         password: passwordController.text.trim(),
//       )
//           .then((userCredential) {
//         // Login successful
//         String userEmail = userCredential.user!.email!;
//         Utils.showToast("Logged in as $userEmail");
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => HomePage()),
//         );
//       }).catchError((error) {
//         // Login failed
//         debugPrint("Login error: $error");
//         Utils.showToast("Login failed. Please check your credentials.");
//       });
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     //  final numcontroller=TextEditingController();
//
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: SizedBox(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         child: Form(
//           key: _formkey,
//           child: Column(
//             children: [
//               _buildAppBar(context),
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Container(
//                     padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "lbl_sign_up_login".tr,
//                           style: theme.textTheme.titleLarge,
//                         ),
//                         SizedBox(height: MediaQuery.of(context).size.height * 0.05),
//                         Padding(
//                           padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.01),
//                           child: Selector<SignUpLoginProvider,
//                               TextEditingController?>(
//                             selector: (
//                                 context,
//                                 provider,
//                                 ) =>
//                             provider.emailcontroller,
//                             builder: (context, emailcontroller, child) {
//                               return
//                                 TextFormField(
//                                   validator: (value){
//                                     if(value!.isEmpty){
//                                       return "Enter Email";
//                                     }
//                                     return null;
//                                   },
//                                 style: TextStyle(height: 1),
//                                 controller: emailcontroller,
//                                 decoration: InputDecoration(
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.04),
//                                     borderSide: BorderSide.none
//                                   ),
//                                   contentPadding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.02,horizontal: MediaQuery.of(context).size.width * 0.03),
//                                    fillColor: Colors.grey.shade100,
//                                    focusColor: Colors.black,
//                                    filled: true,
//                                    hintText: "Email",
//                                   hintStyle: TextStyle(fontSize: 15),
//                                   prefixIcon: Icon(Icons.email,size: 16,)
//
//                                 ),
//                                 keyboardType: TextInputType.emailAddress,
//                               );
//                             },
//                           ),
//                         ),
//                         SizedBox(height: MediaQuery.of(context).size.height * 0.02),
//                         Padding(
//                           padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.01),
//                           child: Selector<SignUpLoginProvider,
//                               TextEditingController?>(
//                             selector: (
//                                 context,
//                                 provider,
//                                 ) =>
//                             provider.passcontroller,
//                             builder: (context, passcontroller, child) {
//                               return
//                                 TextFormField(
//                                   validator: (value){
//                                     if(value!.isEmpty){
//                                       return "Enter Password";
//                                     }
//                                     return null;
//                                   },
//                                   style: TextStyle(height: 1),
//                                   controller: passcontroller,
//                                   decoration: InputDecoration(
//                                     border: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.05),
//                                         borderSide: BorderSide.none
//                                     ),
//                                     contentPadding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.02,horizontal: MediaQuery.of(context).size.width * 0.03),
//
//                                       fillColor: Colors.grey.shade100,
//                                       focusColor: Colors.black,
//                                       filled: true,
//                                       hintText: "Password",
//                                       hintStyle: TextStyle(fontSize: 15),
//                                       prefixIcon: Icon(Icons.password,size: 16,)
//
//                                   ),
//                                   keyboardType: TextInputType.visiblePassword,
//                                 );
//                             },
//                           ),
//                         ),
//                         SizedBox(height: MediaQuery.of(context).size.height * 0.02),
//                         ElevatedButton(
//                           onPressed: login,
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Color(0xFF4C2559),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.04),
//                             ),
//                             minimumSize: Size(
//                               MediaQuery.of(context).size.width * 0.90,
//                               MediaQuery.of(context).size.height * 0.06,
//                             ),
//                           ),
//                           child: Text(
//                             "Continue",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 13,
//                             ),
//                           ),
//                         ),
//
//
//                         SizedBox(height: MediaQuery.of(context).size.height * 0.03),
//
//
//
//
//                         SizedBox(height: MediaQuery.of(context).size.height * 0.02),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text("Didn't have an account?"),
//                           SizedBox(width: MediaQuery.of(context).size.width * 0.02),
//                           InkWell(
//                             onTap: (){
//                               Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterScreen()));
//                             },
//                               child: Text("SIGN UP",style: TextStyle(fontWeight: FontWeight.bold),))
//                         ],
//                       ),
//                         SizedBox(height: MediaQuery.of(context).size.height * 0.45,),
//                         //  Spacer(),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Center(
//                               child: Text("By continuing, you agree that you have read and accepted our",
//                                 style: TextStyle(
//                                   fontSize: 10.5,
//                                   color: Colors.grey,
//                                 ),),
//                             ),
//                           ],
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Center(
//                               child: Text("T&Cs",
//                                 style: TextStyle(
//                                   fontSize: 12,
//                                   color: Color(0xFF4C2659),
//                                 ),),
//                             ),
//                             SizedBox(width: MediaQuery.of(context).size.width * 0.005,),
//                             Center(
//                               child: Text("and",
//                                 style: TextStyle(
//                                   fontSize: 10,
//                                   color: Colors.grey,
//                                 ),),
//                             ),
//                             SizedBox(width: MediaQuery.of(context).size.width * 0.005,),
//                             Center(
//                               child: Text("Privacy Policy",
//                                 style: TextStyle(
//                                   fontSize: 12,
//                                   color: Color(0xFF4C2659),
//                                 ),),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   /// Section Widget
//   Widget _buildStackWithAppBar(BuildContext context) {
//     return Align(
//       alignment: Alignment.topCenter,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           SizedBox(
//             height: MediaQuery.of(context).size.height * 0.09,
//             width: MediaQuery.of(context).size.width,
//             child: Stack(
//               alignment: Alignment.centerRight,
//               children: [
//                 Container(
//                   height: MediaQuery.of(context).size.height*0.09,
//                   width: MediaQuery.of(context).size.width*0.09,
//                   color: Colors.purple,
//                 ),
//                 // ),
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: Container(
//                     height: MediaQuery.of(context).size.height * 0.09,
//                     width: MediaQuery.of(context).size.width * 0.297,
//                     decoration: BoxDecoration(
//                       color:
//                       theme.colorScheme.onPrimaryContainer.withOpacity(1),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: MediaQuery.of(context).size.height * 0.0001),
//           Divider(
//             thickness: 5,
//             color: Colors.grey.shade100,
//           ),
//         ],
//       ),
//     );
//   }
//
//
//   Widget _buildAppBar(BuildContext context) {
//     return SizedBox(
//       height: MediaQuery.of(context).size.height * 0.1,
//       width: MediaQuery.of(context).size.width,
//       child: Stack(
//         alignment: Alignment.topLeft,
//         children: [
//           Positioned(
//             left: 0,
//             top: 0,
//             child: Container(
//               width: MediaQuery.of(context).size.width * 0.260, // Adjust container size
//               height: MediaQuery.of(context).size.height * 0.260, // Adjust container size
//             ),
//           ),
//           Image(
//             image: AssetImage("assets/log6.png"),
//             width: MediaQuery.of(context).size.width * 0.200, // Adjust width as needed
//             height: MediaQuery.of(context).size.height * 0.360, // Adjust height as needed
//           ),
//           Positioned(
//             left: MediaQuery.of(context).size.width * 0.150 + 9.0, // Adjust the offset as needed
//             top: MediaQuery.of(context).size.height * 0.037, // Adjust top position to align with the image
//             child: Text(
//               "kavach",
//               style: TextStyle(fontSize: 20,), // Adjust font size as needed
//             ),
//           ),
//           _buildStackWithAppBar(context),
//         ],
//       ),
//     );
//   }
//
//
// }
//
// class Utils {
//   static void showToast(String message) {
//     Fluttertoast.showToast(
//       msg: message,
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.BOTTOM,
//       backgroundColor: Colors.black.withOpacity(0.8),
//       textColor: Colors.white,
//     );
//   }
//
//   void toastMessage(String string) {}
// }




import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kavach_project/localization/app_localization.dart';
import 'package:provider/provider.dart';

import '../../core/utils/image_constant.dart';
import '../../theme/custom_button_style.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../../widgets/custom_image_view.dart';
import '../../widgets/custom_outlined_button.dart';
import '../Sign_up_screen/Sign_up_screen.dart';
import '../home_page/home_page.dart';

class SignUpLoginScreen extends StatefulWidget {
  const SignUpLoginScreen({Key? key}) : super(key: key);

  @override
  _SignUpLoginScreenState createState() => _SignUpLoginScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SignUpLoginProvider(),
      child: SignUpLoginScreen(),
    );
  }
}

class _SignUpLoginScreenState extends State<SignUpLoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();


  void initState() {
    super.initState();
    // Check if user is already signed in
    checkCurrentUser();
  }

  void checkCurrentUser() {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user != null) {
        // User is signed in
        navigateToHomePage();
      }
    });
  }

  void navigateToHomePage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  FirebaseAuth _auth=FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  Future<void> _signInWithGoogle() async {
    try {
      // Trigger the Google Sign-In flow
      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

      if (googleSignInAccount != null) {
        // Obtain the GoogleSignInAuthentication object
        final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

        // Create a new credential
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        // Sign in to Firebase with the Google credential
        final UserCredential userCredential = await _auth.signInWithCredential(credential);

        // Get the user information
        final User? user = userCredential.user;

        if (user != null) {
          // Navigate to your desired screen after successful login
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
        }
      }
    } catch (error) {
      print('Error signing in with Google: $error');
      // Handle sign-in errors here
    }
  }

  void login() {
    if (_formkey.currentState!.validate()) {
      FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      )
          .then((userCredential) {
        // Login successful
        String userEmail = userCredential.user!.email!;
        Utils.showToast("Logged in as $userEmail");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }).catchError((error) {
        // Login failed
        debugPrint("Login error: $error");
        Utils.showToast("Login failed. Please check your credentials.");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              _buildAppBar(context),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "lbl_sign_up_login".tr,
                          // Replace this with your localization logic
                          style: TextStyle(fontSize: 24),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.05),
                                  borderSide: BorderSide.none
                              ),
                              contentPadding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.02,horizontal: MediaQuery.of(context).size.width * 0.03),

                              fillColor: Colors.grey.shade100,
                              focusColor: Colors.black,
                              filled: true,
                              hintText: "Email",
                              hintStyle: TextStyle(fontSize: 15),
                              prefixIcon: Icon(Icons.password,size: 16,)

                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Email";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: passwordController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.05),
                                  borderSide: BorderSide.none
                              ),
                              contentPadding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.02,horizontal: MediaQuery.of(context).size.width * 0.03),

                              fillColor: Colors.grey.shade100,
                              focusColor: Colors.black,
                              filled: true,
                              hintText: "Password",
                              hintStyle: TextStyle(fontSize: 15),
                              prefixIcon: Icon(Icons.password,size: 16,)

                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Password";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                    ElevatedButton(
                          onPressed: login,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF4C2559),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.04),
                            ),
                            minimumSize: Size(
                              MediaQuery.of(context).size.width * 0.90,
                              MediaQuery.of(context).size.height * 0.06,
                            ),
                          ),
                          child: Text(
                            "Continue",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.021,),
                          child: Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.02),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        top: MediaQuery.of(context).size.height * 0.004,
                                        bottom: MediaQuery.of(context).size.height * 0.01,
                                      ),
                                      child: Divider(
                                        color: appTheme.black900,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.02),
                                    child: Text(
                                      "lbl_or".tr,
                                      style: CustomTextStyles.bodyMedium15,
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        top: MediaQuery.of(context).size.height * 0.004,
                                        bottom: MediaQuery.of(context).size.height * 0.01,
                                      ),
                                      child: Divider(
                                        color: appTheme.black900,
                                        // indent: MediaQuery.of(context).size.width * 0.02,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 3,top: 11,right: 3),
                          child: CustomOutlinedButton(
                            onPressed: _signInWithGoogle,
                            text: "msg_continue_with_google".tr,

                            margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.004,
                              right: MediaQuery.of(context).size.width * 0.002,
                              top: MediaQuery.of(context).size.height * 0.002,
                              bottom: MediaQuery.of(context).size.height * 0.002,
                            ),
                            leftIcon: Container(
                              margin: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.03),
                              child: CustomImageView(
                                imagePath: ImageConstant
                                    .imgVecteezygooglelogoontransparentbackgroundpopularsearchengine292849641,
                                height: MediaQuery.of(context).size.height * 0.02,
                                width: MediaQuery.of(context).size.height * 0.02,

                              ),
                            ),
                            buttonStyle: CustomButtonStyles.outlineErrorContainer,
                            buttonTextStyle: CustomTextStyles.bodySmallBlack90012,
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.06,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Didn't have an account?"),
                            SizedBox(width: 5),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RegisterScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                "SIGN UP",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height:MediaQuery.of(context).size.height * 0.3, ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text("By continuing, you agree that you have read and accepted our",
                                style: TextStyle(
                                  fontSize: 10.5,
                                  color: Colors.grey,
                                ),),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text("T&Cs",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF4C2659),
                                ),),
                            ),
                            SizedBox(width: MediaQuery.of(context).size.width * 0.005,),
                            Center(
                              child: Text("and",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey,
                                ),),
                            ),
                            SizedBox(width: MediaQuery.of(context).size.width * 0.005,),
                            Center(
                              child: Text("Privacy Policy",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF4C2659),
                                ),),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStackWithAppBar(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.09,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              alignment: Alignment.centerRight,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height*0.09,
                  width: MediaQuery.of(context).size.width*0.09,
                  color: Colors.purple,
                ),
                // ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.09,
                    width: MediaQuery.of(context).size.width * 0.297,
                    decoration: BoxDecoration(
                      color:
                      theme.colorScheme.onPrimaryContainer.withOpacity(1),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.0001),
          Divider(
            thickness: 5,
            color: Colors.grey.shade100,
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Image.asset(
            "assets/log6.png",
            width: MediaQuery.of(context).size.width * 0.25,
            height: MediaQuery.of(context).size.height * 0.25,
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.18 + 9.0,
            top: MediaQuery.of(context).size.height * 0.032,
            child: Text(
              "kavach",
              style: TextStyle(fontSize: 25,fontFamily: 'kalam',fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}

class Utils {
  static void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black.withOpacity(0.8),
      textColor: Colors.white,
    );
  }
}

class SignUpLoginProvider extends ChangeNotifier {
  // You can implement provider related logic here if needed
}

