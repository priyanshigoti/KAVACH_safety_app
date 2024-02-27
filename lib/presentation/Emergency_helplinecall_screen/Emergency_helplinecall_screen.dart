import 'package:flutter/material.dart';
import 'package:kavach_project/presentation/Emergency_helplinecall_screen/provider/Emergency_helplinecall_screen_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';

import 'models/Emergency_helplinecall_screen_models.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Helpline Numbers',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EmergencyHelplineScreen(),
    );
  }
}

class EmergencyHelplineScreen extends StatelessWidget {
  const EmergencyHelplineScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Helplines'),
      ),
      body: Consumer<EmergencyHelplineProvider>(
        builder: (context, provider, _) {
          return ListView.builder(
            itemCount: provider.helplines.length,
            itemBuilder: (context, index) {
              return HelplineCard(helplineData: provider.helplines[index]);
            },
          );
        },
      ),
    );
  }
}

class HelplineCard extends StatelessWidget {
  final EmergencyHelplineModel helplineData;

  const HelplineCard({Key? key, required this.helplineData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          color: helplineData.color,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Image.asset(
              helplineData.image,
              width: 60,
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    helplineData.number,
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  Text(
                    helplineData.name,
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ],
              ),
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.phone, color: Colors.black,size: 30,),
              onPressed: () {
                _makePhoneCall(helplineData.number);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _makePhoneCall(String number) async {
    if (await canLaunch('tel:$number')) {
      await launch('tel:$number');
    } else {
      throw 'Could not launch $number';
    }
  }
}
