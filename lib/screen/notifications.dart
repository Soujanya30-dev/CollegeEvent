import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  final List<String> notifications = [
    "Hackathon starts in 2 days!",
    "Cultural Fest: Fusion Fiesta on Friday!",
    "Tech Talk: AI and the Future",
    "Startup Pitch Night on Thursday!",
    "Eco-Warrior Day next week!",
    "Photography Walk on Saturday!",
    "Research Symposium tomorrow!",
    "Gaming Tournament this weekend!"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Icon(Icons.notification_important, color: Colors.teal),
              title: Text(notifications[index]),
              onTap: () {
                _showNotificationDialog(context, notifications[index]);
              },
            ),
          );
        },
      ),
    );
  }

  void _showNotificationDialog(BuildContext context, String notification) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Notification Details'),
          content: Text(notification),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
            TextButton(
              onPressed: () {
                // Add any additional functionality here (e.g., mark as read)
                Navigator.of(context).pop();
              },
              child: Text('Mark as Read'),
            ),
          ],
        );
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: NotificationsScreen(),
  ));
}
