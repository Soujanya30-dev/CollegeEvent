import 'package:flutter/material.dart';

class UpcomingEventsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upcoming Events'),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView(
        children: [
          _buildEventCard(
            ' Student Scavenger Hunt',
            '''
                 The Student Scavenger Hunt is scheduled for september 5th at 11 am  on the college campus. 
                 Participants will form teams and receive a list of items and challenges to complete within 2
                 hours. The hunt will involve both physical and digital clues, encouraging teamwork, creativity,
                 and quick thinking. Prizes will be awarded to the top-performing teams. The event is open to
                 all students, and registration is required.
            ''',
            'lib/assets/images/event1.jpeg',
          ),
          _buildEventCard(
            'Student Tours',
            '''
                Student tours offer a unique opportunity for students to explore new places, learn about different
                cultures, and gain valuable life experiences. These tours can be academic, cultural, or adventure
                -based, providing students with a chance to step outside their comfort zone and broaden their horizons
             ''',
            'lib/assets/images/event2.jpg',
          ),
          _buildEventCard(
            'Sports Day',
            '''
                 Sports day is an annual event celebrated in colleges worldwide. It is a day dedicated to sports and physical 
                 activities, where students participate in various competitions and showcase their athletic abilities. Sports
                 day promotes sportsmanship, teamwork, and healthy competition among students, fostering a positive and
                 energetic atmosphere.
            ''',
            'lib/assets/images/event3.jpeg',
          ),
          _buildEventCard(
            'Music Event',
            '''
                Music events are gatherings where people come together to enjoy and appreciate music. These events can feature 
                a variety of genres and artists, from classical concerts to rock festivals. Music events provide a platform for
                musicians to showcase their talent and for audiences to connect through their shared love of music.
             ''',
            'lib/assets/images/event4.jpeg',
          ),
          _buildEventCard(
            'Food Parties',
            '''
              Food parties in colleges are social events centered around food and celebration. These parties can take various 
              forms, such as potlucks, buffets, or themed gatherings. They provide a fun and enjoyable way for students to 
              connect with their peers, share delicious food, and create lasting memories.
            ''',
            'lib/assets/images/event5.jpeg',
          ),
          _buildEventCard(
            'Flash Mob',
            '''
              Flash mobs in colleges are spontaneous dance or performance events that involve a large group of people suddenly 
              breaking into a choreographed routine in a public space. These events are often organized to surprise and entertain
              onlookers, promote a cause, or simply create a fun and memorable experience for participants.
            ''',
            'lib/assets/images/event6.jpeg',
          ),
          _buildEventCard(
            'Motivational Talks',
            '''
                 Motivational talks in college are inspiring speeches designed to encourage and empower students to achieve their
                 goals. These talks often feature successful individuals who share their personal stories, challenges, and strategies
                 for overcoming obstacles. By providing students with motivation, inspiration, and practical advice, these talks can 
                 help them develop a positive mindset and strive for success in their academic and personal lives
            ''',
            'lib/assets/images/event7.jpeg',
          ),
          _buildEventCard(
            'Fashion Event',
            '''
              Fashion events in colleges are gatherings that showcase the latest trends in fashion and design. These events often
              feature runway shows, design competitions, and themed parties, providing students with an opportunity to express their
              creativity, learn about the fashion industry, and connect with like-minded individuals.
            ''',
            'lib/assets/images/event8.jpeg',
          ),
          _buildEventCard(
            'Film Fest',
            '''
                 Film festivals are events that showcase a collection of films from various genres and filmmakers. They provide a
                 platform for filmmakers to present their work to audiences and critics, while also offering attendees the opportunity 
                 to discover new and emerging talent. Film festivals can be held in various locations, from major cities to smaller 
                 towns, and can focus on specific genres, themes, or regions
            ''',
            'lib/assets/images/event9.jpeg',
          ),
          _buildEventCard(
            'College Podcast',
            '''
               College podcasts are audio programs created by college students or faculty members. These podcasts cover a wide range of
               topics, from academic subjects to campus life and current events. They offer a platform for students to express their
               ideas, share their knowledge, and connect with a wider audience. College podcasts can be a valuable tool for learning,
               entertainment, and staying informed about campus news.
            ''',
            'lib/assets/images/event10.jpeg',
          ),
        ],
      ),
    );
  }

  Widget _buildEventCard(String title, String description, String imagePath) {
    return Card(
      margin: EdgeInsets.all(16.0),
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 200, // Adjust height as needed
          ),
          Padding(
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
