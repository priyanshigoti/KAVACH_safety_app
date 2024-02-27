

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LangSetting extends StatefulWidget {
  const LangSetting({Key? key}) : super(key: key);

  @override
  State<LangSetting> createState() => _LangSettingState();
}

class _LangSettingState extends State<LangSetting> {
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
                        child: Icon(Icons.arrow_back_ios_new_sharp, size: MediaQuery.of(context).size.width * 0.07, color: Color(0xFF4C2559)),
                      ),
                      Expanded(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "Language Setting",
                              style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.045, color: Color(0xFF4C2559)),
                            ),
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
                    padding: const EdgeInsets.only(top: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(image: AssetImage("assets/letter-a.png"), height: MediaQuery.of(context).size.width * 0.1, width: MediaQuery.of(context).size.width * 0.1),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text("English", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF4C2559))),
                              ),
                            ],
                          ),
                          height: MediaQuery.of(context).size.width * 0.25,
                          width: MediaQuery.of(context).size.width * 0.25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 3,
                                  color: Colors.grey,
                                  offset: Offset(0, 2)
                              )
                            ],
                            color: Colors.purple.shade100,
                          ),
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(image: AssetImage("assets/A-removebg-preview.png"), height: MediaQuery.of(context).size.width * 0.13, width: MediaQuery.of(context).size.width * 0.13),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 7),
                                child: Text("Gujarati", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF4C2559))),
                              ),
                            ],
                          ),
                          height: MediaQuery.of(context).size.width * 0.25,
                          width: MediaQuery.of(context).size.width * 0.25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 3,
                                  color: Colors.grey,
                                  offset: Offset(0, 2)
                              )
                            ],
                            color: Colors.purple.shade100,
                          ),
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(image: AssetImage("assets/pngwing.com.png"), height: MediaQuery.of(context).size.width * 0.085, width: MediaQuery.of(context).size.width * 0.085),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text("Hindi", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF4C2559))),
                              ),
                            ],
                          ),
                          height: MediaQuery.of(context).size.width * 0.25,
                          width: MediaQuery.of(context).size.width * 0.25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 3,
                                  color: Colors.grey,
                                  offset: Offset(0, 2)
                              )
                            ],
                            color: Colors.purple.shade100,
                          ),
                        ),
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
