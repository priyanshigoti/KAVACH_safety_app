import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kavach_project/presentation/E-learning/video_model.dart';
import 'package:kavach_project/presentation/E-learning/ytPlayer.dart';

class videoList extends StatelessWidget {
  const videoList({super.key});

  Future<List<videoModel>> readJsonData() async {
    final jsonData = await rootBundle.loadString('json_file/videoList.json');
    final list = json.decode(jsonData) as List<dynamic>;

    return list.map((e) => videoModel.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                'Chapters of E-Learning',
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
                  child: Center(
                    child:
                    FutureBuilder(
                      future: readJsonData(),
                      builder: (context, data) {
                        if (data.hasError) {
                          return Text('${data.error}');
                        } else if (data.hasData) {
                          var items = data.data as List<videoModel>;
                          return ListView.builder(
                              itemCount: items == null ? 0 : items.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    // print(items[index].videoUrl.toString());
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (builder) => YT_Player(
                                                ytUrl: items[index].videoUrl.toString())));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Card(
                                      elevation: 3,
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Icon(Icons.ondemand_video),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(12),
                                            height: 60,
                                            child: Text(
                                              items[index].title.toString(),
                                              style: TextStyle(
                                                fontSize: 17,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
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
