import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'If you have any questions or concerns, please feel free to contact us:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                _launchEmail(context);
              },
              child: Text(
                'support@example.com',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to launch email app with pre-filled email
  void _launchEmail(BuildContext context) async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'kavach1@gmail.com', // Replace with your email address
      query: 'subject=Feedback%20for%20Women%20Safety%20App', // You can set a default subject here
    );
    final String url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not launch email app')),
      );
    }
  }
}
