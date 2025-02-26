import 'package:flutter/material.dart';

class MyEventsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Events'),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView(
        children: [
          _buildEventCard(
              'Hackathon Extravaganza',
              'description:A 24-hour coding marathon where students form teams to build innovative projects. Prizes are awarded for the best solutions.',
              'August 21, 2024'),
          _buildEventCard(
              'Cultural Fest',
              'description:A multicultural celebration featuring dance, music, art exhibitions, and culinary delights from around the world.',
              'August 22, 2024'),
          _buildEventCard(
              'Tech Talk Series',
              'description:Weekly seminars where industry experts share insights on the latest trends in technology, AI, cybersecurity, and more.',
              'August 23, 2024'),
          _buildEventCard(
              'Startup Pitch Night',
              'description:An event where aspiring student entrepreneurs pitch their startup ideas to a panel of judges for feedback and potential funding',
              'August 24, 2024'),
          _buildEventCard(
              'Gaming Tournament',
              'description:A competitive gaming event featuring popular games like FIFA, Call of Duty, and League of Legends, with prizes for the top players.',
              'August 25, 2024'),
          _buildEventCard(
              'Research Symposium',
              'description:A showcase of student and faculty research projects, allowing participants to present their findings and network with peers and professors.',
              'August 26, 2024'),
          _buildEventCard(
              'Eco-Warrior Day',
              'description:A day dedicated to environmental awareness, including tree planting, recycling workshops, and a campus clean-up drive',
              'August 27, 2024'),
          _buildEventCard(
              'Photography Walk and Contest',
              'description:A guided photography walk around the campus, followed by a contest where participants submit their best shots for judging and exhibition.',
              'August 28, 2024'),
        ],
      ),
    );
  }

  Widget _buildEventCard(String title, String description, String date) {
    return Card(
      margin: EdgeInsets.all(16.0),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 8),
            Text(
              date,
              style: TextStyle(
                fontSize: 14,
                color: Colors.blueAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
