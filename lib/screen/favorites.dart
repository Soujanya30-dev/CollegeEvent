import 'package:flutter/material.dart';

class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<Map<String, dynamic>> items = [
    {"name": "Hackathon Extravaganza", "isFavorite": false},
    {"name": "Cultural Fest: Fusion Fiesta", "isFavorite": false},
    {"name": "Tech Talk: AI and the Future", "isFavorite": false},
    {"name": "Startup Pitch Night", "isFavorite": false},
    {"name": "Eco-Warrior Day", "isFavorite": false},
    {"name": "Photography Walk and Contest", "isFavorite": false},
    {"name": "Research Symposium", "isFavorite": false},
    {"name": "Gaming Tournament", "isFavorite": false},
  ];

  List<Map<String, dynamic>> get favoriteItems {
    return items.where((item) => item['isFavorite']).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 3 / 2,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  items[index]['isFavorite'] = !items[index]['isFavorite'];
                });
              },
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Text(
                        items[index]['name'],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Icon(
                        items[index]['isFavorite']
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: items[index]['isFavorite']
                            ? Colors.red
                            : Colors.grey,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: FavoritesScreen(),
  ));
}
