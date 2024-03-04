



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

import 'forget_pass_screen.dart';

class email_recovery extends StatefulWidget {
  const email_recovery({super.key});

  @override
  State<email_recovery> createState() => _email_recoveryState();
}

class _email_recoveryState extends State<email_recovery> {
  @override
  Widget build(BuildContext context) {




    String enteredPin = "";
    final pinController=TextEditingController();
    final emailcontroller=TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center vertically
          crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
          children: [
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.00),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Center vertically
                crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start, // Center horizontally
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Icon(Icons.arrow_back_ios_new_sharp,size: 25,color: Color(0xFF4C2559),),
                      ),
                      Container(
                        child: Image.asset(
                          'assets/log6.png',
                          fit: BoxFit.fitHeight,
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 0.15,
                          height: MediaQuery.of(context).size.width * 0.24,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 150),
                        child: Text(
                          "kavach",
                          style: TextStyle(fontFamily:'kalam',fontSize: MediaQuery.of(context).size.width * 0.065, color: Color(0xFF4C2559)),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: MediaQuery.of(context).size.width * 0.011,
                    color: Colors.grey.shade100,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center, // Center horizontally
                      children: [
                        Text(
                          "Mail Address Here",
                          style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.065, color: Color(0xFF4C2559)),
                        ),
                      ],
                    ),
                  ),
                  //  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Padding(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.03, right: MediaQuery.of(context).size.width * 0.03),
                    child: Text(
                      'Enter the email address associated with your google account.',
                      style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.040),
                      textAlign: TextAlign.center, // Align text at the center
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  Padding(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.06, right: MediaQuery.of(context).size.width * 0.06),
                    child: TextFormField(
                      // validator: (value){
                      //   if(value!.isEmpty){
                      //     return "Enter Email";
                      //   }
                      //   return null;
                      // },
                      style: TextStyle(height: 1.2),
                      controller: emailcontroller,
                     // validator: _validateEmail,

                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.04),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.020, horizontal: MediaQuery.of(context).size.width * 0.045),
                          hintText: "Email",
                          hintStyle: TextStyle(fontSize: 14),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          prefixIcon: Icon(Icons.email)
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center, // Center vertically
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetPass()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF4C2559),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17),
                          ),
                          minimumSize: Size(
                            MediaQuery.of(context).size.width * 0.50,
                            MediaQuery.of(context).size.height * 0.06,
                          ),
                        ),
                        child: Text(
                          "Get code",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width * 0.035,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
