import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  Map<DateTime, List<String>> _events = {};

  @override
  void initState() {
    super.initState();

    // Sample events data
    _events = {
      DateTime.utc(2024, 8, 21): ['Hackathon Extravaganza'],
      DateTime.utc(2024, 8, 25): ['Cultural Fest: Fusion Fiesta'],
      DateTime.utc(2024, 8, 27): ['Tech Talk: AI and the Future'],
      DateTime.utc(2024, 9, 1): ['Startup Pitch Night'],
      DateTime.utc(2024, 9, 7): ['Eco-Warrior Day'],
      DateTime.utc(2024, 9, 12): ['Photography Walk and Contest'],
      DateTime.utc(2024, 9, 18): ['Research Symposium'],
      DateTime.utc(2024, 9, 22): ['Gaming Tournament: Battle of the Consoles'],
    };
  }

  List<String> _getEventsForDay(DateTime day) {
    return _events[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Calendar'),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });

              _showEventsDialog(context, _getEventsForDay(selectedDay));
            },
            eventLoader: _getEventsForDay,
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Colors.tealAccent,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.teal,
                shape: BoxShape.circle,
              ),
              markerDecoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              titleTextStyle:
                  TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
              weekendStyle: TextStyle(color: Colors.red),
            ),
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
          ),
          Expanded(
            child: _selectedDay == null
                ? Center(child: Text('Select a day to see events'))
                : ListView.builder(
                    itemCount: _getEventsForDay(_selectedDay!).length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(_getEventsForDay(_selectedDay!)[index]),
                          trailing:
                              Icon(Icons.event_available, color: Colors.teal),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  void _showEventsDialog(BuildContext context, List<String> events) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Events',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              ...events.map((event) => ListTile(
                    leading: Icon(Icons.event, color: Colors.teal),
                    title: Text(event),
                  )),
            ],
          ),
        );
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CalendarScreen(),
  ));
}
