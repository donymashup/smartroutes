import 'package:flutter/material.dart';

class BusStopsScreen extends StatelessWidget {
  final String from;
  final String to;

  const BusStopsScreen({super.key, required this.from, required this.to});

  @override
  Widget build(BuildContext context) {
    // Dummy list of bus stops (you can replace with dynamic data)
    final List<String> busStops = [
      "Main Bus Station",
      "Town Hall",
      "Library Junction",
      "Tech Park",
      "Central Mall",
      "University Gate",
      "Airport Road",
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Bus Stops: $from → $to'),
        backgroundColor: Colors.lightBlue[200],
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: busStops.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.lightBlue[100],
                child: Text('${index + 1}', style: const TextStyle(fontWeight: FontWeight.bold)),
              ),
              title: Text(
                busStops[index],
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              trailing: const Icon(Icons.directions_bus, color: Colors.blueAccent),
            ),
          );
        },
      ),
    );
  }
}
