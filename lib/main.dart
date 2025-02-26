import 'package:flutter/material.dart';
import 'package:event_pulse/screen/myevents.dart';
import 'package:event_pulse/screen/upcoming.dart';
import 'package:event_pulse/screen/notifications.dart';
import 'package:event_pulse/screen/calendar.dart';
import 'package:event_pulse/screen/favorites.dart';
import 'package:event_pulse/screen/settings.dart';
import 'package:event_pulse/screen/profile.dart';
import 'package:event_pulse/screen/search.dart';
import 'package:event_pulse/screen/idea_box.dart';
import 'package:event_pulse/screen/registration.dart';
import 'package:event_pulse/screen/feedback.dart';

void main() {
  runApp(EventPulseApp());
}

class EventPulseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EventPulse',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> _filteredEvents = [
    {
      'name': 'Hackathon Extravaganza',
      'date': 'August 21, 2024',
      'time': '10:00 AM - 4:00 PM',
      'location': 'Tech Auditorium, Building B',
      'description':
          'A 24-hour coding marathon where students form teams to build innovative projects. Prizes are awarded for the best solutions.',
    },
    // Add more events as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EventPulse'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'EventPulse Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            _buildDrawerItem(context, 'My Events', MyEventsScreen()),
            _buildDrawerItem(
                context, 'Upcoming Events', UpcomingEventsScreen()),
            _buildDrawerItem(context, 'Notifications', NotificationsScreen()),
            _buildDrawerItem(context, 'Calendar', CalendarScreen()),
            _buildDrawerItem(context, 'Favorites', FavoritesScreen()),
            _buildDrawerItem(context, 'Settings', SettingsScreen()),
            _buildDrawerItem(context, 'Profile', ProfileScreen()),
            _buildDrawerItem(context, 'Search', SearchScreen()),
            _buildDrawerItem(context, 'Idea Box', IdeaBoxScreen()),
            _buildDrawerItem(context, 'Registration', RegistrationScreen()),
            _buildDrawerItem(context, 'Feedback', FeedbackScreen()),
            _buildDrawerItem(
              context,
              'Event Details',
              EventDetailsScreen(
                eventName: _filteredEvents[0]['name']!,
                eventDate: _filteredEvents[0]['date']!,
                eventTime: _filteredEvents[0]['time']!,
                eventLocation: _filteredEvents[0]['location']!,
                eventDescription: _filteredEvents[0]['description']!,
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'lib/assets/images/background1.jpg',
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black54,
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'EventPulse',
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: Colors.black.withOpacity(0.5),
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Welcome to EventPulse',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search for events...',
                      filled: true,
                      fillColor: Colors.white24,
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.search, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text, Widget screen) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          textStyle: TextStyle(fontSize: 16),
        ),
        child: Text(text),
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, String title, Widget screen) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
    );
  }
}

class EventDetailsScreen extends StatelessWidget {
  final String eventName;
  final String eventDate;
  final String eventTime;
  final String eventLocation;
  final String eventDescription;

  EventDetailsScreen({
    required this.eventName,
    required this.eventDate,
    required this.eventTime,
    required this.eventLocation,
    required this.eventDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              eventName,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.calendar_today),
                SizedBox(width: 10),
                Text(
                  eventDate,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.access_time),
                SizedBox(width: 10),
                Text(
                  eventTime,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.location_on),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    eventLocation,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Event Description',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              eventDescription,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton.icon(
              icon: Icon(Icons.calendar_today),
              label: Text('Add to Calendar'),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Calendar'),
                      content: Text('Event added to your calendar.'),
                      actions: <Widget>[
                        TextButton(
                          child: Text('Close'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              icon: Icon(Icons.share),
              label: Text('Share Event'),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Share'),
                      content: Text('Share event with others!'),
                      actions: <Widget>[
                        TextButton(
                          child: Text('Close'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
