import 'package:flutter/material.dart';
import 'package:event_pulse/screen/myevents.dart';
import 'package:event_pulse/screen/upcoming.dart';
import 'package:event_pulse/screen/notifications.dart';
import 'package:event_pulse/screen/favorites.dart';
import 'package:event_pulse/screen/settings.dart';
import 'package:event_pulse/screen/profile.dart';
import 'package:event_pulse/screen/search.dart';
import 'package:event_pulse/screen/idea_box.dart';
import 'package:event_pulse/screen/registration.dart';
import 'package:event_pulse/screen/feedback.dart';

class HomeScreen extends StatelessWidget {
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
            _buildDrawerItem(context, 'Favorites', FavoritesScreen()),
            _buildDrawerItem(context, 'Settings', SettingsScreen()),
            _buildDrawerItem(context, 'Profile', ProfileScreen()),
            _buildDrawerItem(context, 'Search', SearchScreen()),
            _buildDrawerItem(context, 'Idea Box', IdeaBoxScreen()),
            _buildDrawerItem(context, 'Registration', RegistrationScreen()),
            _buildDrawerItem(context, 'Feedback', FeedbackScreen()),
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
                  child: Text(
                    'Welcome to EventPulse',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
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
