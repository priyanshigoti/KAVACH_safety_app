import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SOSAlertScreen extends StatefulWidget {
  @override
  _SOSAlertScreenState createState() => _SOSAlertScreenState();
}

class _SOSAlertScreenState extends State<SOSAlertScreen> {
  int _secondsRemaining = 5;
  bool _isCounting = true;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    Future.delayed(Duration(seconds: 1), () {
      if (_secondsRemaining > 0 && _isCounting) {
        setState(() {
          _secondsRemaining--;
        });
        _startTimer();
      } else if (_secondsRemaining == 0) {
        _callSOSNumber(); // Call SOS number when timer reaches 0
      }
    });
  }

  void _callSOSNumber() async {
    const url = 'tel:100'; // Replace with your desired emergency number
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SOS Alert'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'SOS Alert Activated',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              '$_secondsRemaining seconds remaining',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isCounting = false; // Stop the timer
                    });
                  },
                  child: Text('Stop'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isCounting = true; // Continue the timer
                    });
                    _startTimer();
                  },
                  child: Text('Continue'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}