
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Legal extends StatefulWidget {
  const Legal({Key? key})
      : super(
    key: key,
  );

  @override
  State<Legal> createState() => _LegalState();
}

class _LegalState extends State<Legal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Icon(Icons.arrow_back_ios_new_sharp, size: MediaQuery.of(context).size.width * 0.05, color: Color(0xFF4C2559)),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            "Legal",
                            style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.048, color: Color(0xFF4C2559)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                  Divider(
                    thickness: MediaQuery.of(context).size.width * 0.010,
                    color: Colors.grey.shade100,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Legal()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.purple.shade100, // Set your desired border color here
                                  width: 1, // Set the width of the border
                                ),
                                borderRadius: BorderRadius.circular(10),

                              ),
                              height: MediaQuery.of(context).size.width * 0.14,
                                 width: MediaQuery.of(context).size.width * 0.88,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text("Terms and conditions",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Color(0xFF4C2559)),),
                                  ),
                                  SizedBox(width: 133.5,),
                                  Container(
                                    height: 25,width: 25,
                                      child: Image(image: AssetImage("assets/up-right-arrow_4664830.png"))),
                                //  IconButton(onPressed: (){}, icon: Icon(Icons.upload_sharp)),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Legal()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.purple.shade100, // Set your desired border color here
                                  width: 1, // Set the width of the border
                                ),
                                borderRadius: BorderRadius.circular(10),

                              ),
                              height: MediaQuery.of(context).size.width * 0.14,
                              width: MediaQuery.of(context).size.width * 0.88,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text("Private Policy",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Color(0xFF4C2559)),),
                                  ),
                                  SizedBox(width: 187),
                                  Container(
                                      height: 25,width: 25,
                                      child: Image(image: AssetImage("assets/up-right-arrow_4664830.png"))),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                          GestureDetector(
                            onTap: (){

                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.purple.shade100, // Set your desired border color here
                                  width: 1, // Set the width of the border
                                ),
                                borderRadius: BorderRadius.circular(10),

                              ),
                              height: MediaQuery.of(context).size.width * 0.14,
                              width: MediaQuery.of(context).size.width * 0.88,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text("Disclaimer Policy",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Color(0xFF4C2559)),),
                                  ),
                                  SizedBox(width: 162),
                                  Container(
                                      height: 25,width: 25,
                                      child: Image(image: AssetImage("assets/up-right-arrow_4664830.png"))),
                                ],
                              ),
                            ),
                          ),
                        ),


                        // Container(
                        //   child: Column(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       Image(image: AssetImage("assets/letter-a.png"), height: MediaQuery.of(context).size.width * 0.1, width: MediaQuery.of(context).size.width * 0.1),
                        //       Padding(
                        //         padding: const EdgeInsets.only(top: 5),
                        //         child: Text("English", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF4C2559))),
                        //       ),
                        //     ],
                        //   ),
                        //   height: MediaQuery.of(context).size.width * 0.25,
                        //   width: MediaQuery.of(context).size.width * 0.25,
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(15.0),
                        //     boxShadow: [
                        //       BoxShadow(
                        //           blurRadius: 3,
                        //           color: Colors.grey,
                        //           offset: Offset(0, 2)
                        //       )
                        //     ],
                        //     color: Colors.purple.shade100,
                        //   ),
                        // ),
                        // Container(
                        //   child: Column(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       Image(image: AssetImage("assets/A-removebg-preview.png"), height: MediaQuery.of(context).size.width * 0.13, width: MediaQuery.of(context).size.width * 0.13),
                        //       Padding(
                        //         padding: const EdgeInsets.only(bottom: 7),
                        //         child: Text("Gujarati", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF4C2559))),
                        //       ),
                        //     ],
                        //   ),
                        //   height: MediaQuery.of(context).size.width * 0.25,
                        //   width: MediaQuery.of(context).size.width * 0.25,
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(15.0),
                        //     boxShadow: [
                        //       BoxShadow(
                        //           blurRadius: 3,
                        //           color: Colors.grey,
                        //           offset: Offset(0, 2)
                        //       )
                        //     ],
                        //     color: Colors.purple.shade100,
                        //   ),
                        // ),
                        // Container(
                        //   child: Column(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       Image(image: AssetImage("assets/pngwing.com.png"), height: MediaQuery.of(context).size.width * 0.085, width: MediaQuery.of(context).size.width * 0.085),
                        //       Padding(
                        //         padding: const EdgeInsets.only(top: 5),
                        //         child: Text("Hindi", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF4C2559))),
                        //       ),
                        //     ],
                        //   ),
                        //   height: MediaQuery.of(context).size.width * 0.25,
                        //   width: MediaQuery.of(context).size.width * 0.25,
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(15.0),
                        //     boxShadow: [
                        //       BoxShadow(
                        //           blurRadius: 3,
                        //           color: Colors.grey,
                        //           offset: Offset(0, 2)
                        //       )
                        //     ],
                        //     color: Colors.purple.shade100,
                        //   ),
                        // ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

