import 'package:flutter/material.dart';

import '../models/Emergency_helplinecall_screen_models.dart';

class EmergencyHelplineProvider extends ChangeNotifier {
  List<EmergencyHelplineModel> _helplines = [
    EmergencyHelplineModel(
      number: '100',
      name: 'Police',
      image: 'assets/police.png',
      color: Colors.green.shade100,
    ),
    EmergencyHelplineModel(
      number: '101',
      name: 'Fire Department',
      image: 'assets/fire-truck.png',
      color: Colors.blue.shade100,
    ),
    EmergencyHelplineModel(
      number: '102',
      name: 'Ambulance',
      image: 'assets/ambulance.png',
      color: Colors.orange.shade100,
    ),
    EmergencyHelplineModel(
      number: '181',
      name: 'Women(Domestic Abuse)',
      image: 'assets/women.png',
      color: Colors.brown.shade100,
    ),
    EmergencyHelplineModel(
      number: '1098',
      name: 'Child Helpline',
      image: 'assets/children.png',
      color: Colors.pink.shade100,
    ),
    EmergencyHelplineModel(
      number: '104',
      name: 'National Health',
      image: 'assets/healthcare (1).png',
      color: Colors.deepOrange.shade100,
    ),
    EmergencyHelplineModel(
      number: '108',
      name: 'Road Accident',
      image: 'assets/accident.png',
      color: Colors.grey.shade100,
    ),
    EmergencyHelplineModel(
      number: '1800-180-1104',
      name: 'National Helpiline',
      image: 'assets/phone.png',
      color: Colors.teal.shade100,
    ),
    EmergencyHelplineModel(
      number: '911',
      name: 'Emergency',
      image: 'assets/log6.png',
      color: Colors.deepPurple.shade100,
    ),
  ];

  List<EmergencyHelplineModel> get helplines => _helplines;
}
