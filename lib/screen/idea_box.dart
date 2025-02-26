import 'package:flutter/material.dart';

class IdeaBoxScreen extends StatefulWidget {
  @override
  _IdeaBoxScreenState createState() => _IdeaBoxScreenState();
}

class _IdeaBoxScreenState extends State<IdeaBoxScreen> {
  final List<String> _ideas = [
    'Host a tech workshop for beginners.',
    'Organize a campus-wide scavenger hunt.',
    'Create a peer tutoring program for coding.',
  ];

  final TextEditingController _controller = TextEditingController();

  void _addIdea(String idea) {
    setState(() {
      _ideas.add(idea);
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Idea Box'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Input field to add new ideas
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Add your idea',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      _addIdea(_controller.text);
                    }
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            // List of ideas
            Expanded(
              child: ListView.builder(
                itemCount: _ideas.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        _ideas[index],
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
