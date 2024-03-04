import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationSender extends StatelessWidget {
  final NotificationService _notificationService = NotificationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send Notification'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _notificationService.sendNotification();
          },
          child: Text('Send Notification'),
        ),
      ),
    );
  }
}

class NotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  // Send a notification to a specific FCM token
  Future<void> sendNotification() async {
    // Replace 'YOUR_FCM_TOKEN' with the FCM token of the device you want to send the notification to
    String fcmToken = 'czJQH-sCRUe2E36Vb8qt5V:APA91bGAyIa1QVV1wMUD9y-PSDnp6VJQ-JPbnXYltjqLpZq2NZzueLAVdtAUktFT3sKqcUplYZU9b1xFKfaVQziaF90sWn7EJpbu-p9qG2EgF0-5le2Cpbcpocw46l5QCmAylgG1uE60';

    await _firebaseMessaging.sendMessage(
      to: fcmToken,
      data: <String, String>{
        'title': 'Welcome to Kavach',
        'body': 'This is a test notification sent from Flutter app.',
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: NotificationSender(),
  ));
}
