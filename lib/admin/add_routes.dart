import 'package:flutter/material.dart';

class AddRouteScreen extends StatefulWidget {
  const AddRouteScreen({super.key});

  @override
  State<AddRouteScreen> createState() => _AddRouteScreenState();
}

class _AddRouteScreenState extends State<AddRouteScreen> {
  final TextEditingController routeNameController = TextEditingController();
  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();
  final TextEditingController stopController = TextEditingController();

  final List<String> stops = [];

  // Add a stop to the list
  void addStop() {
    final stop = stopController.text.trim();
    if (stop.isNotEmpty) {
      setState(() {
        stops.add(stop);
        stopController.clear();
      });
    }
  }

  // Remove a stop from the list by index
  void removeStop(int index) {
    setState(() {
      stops.removeAt(index);
    });
  }

  // Save the route with its stops
  void saveRoute() {
    final routeName = routeNameController.text.trim();
    final from = fromController.text.trim();
    final to = toController.text.trim();

    if (routeName.isEmpty || from.isEmpty || to.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all the fields')),
      );
      return;
    }

    // Example structure to send to Firebase (or local storage)
    final routeData = {
      'routeName': routeName,
      'from': from,
      'to': to,
      'stops': stops,
      'createdAt': DateTime.now().toIso8601String(),
    };

    // TODO: Save `routeData` to Firebase

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Route added successfully')),
    );

    // Clear fields
    routeNameController.clear();
    fromController.clear();
    toController.clear();
    stopController.clear();
    setState(() => stops.clear());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Route')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: routeNameController,
              decoration: const InputDecoration(labelText: 'Route Name'),
            ),
            TextField(
              controller: fromController,
              decoration: const InputDecoration(labelText: 'From'),
            ),
            TextField(
              controller: toController,
              decoration: const InputDecoration(labelText: 'To'),
            ),
            const SizedBox(height: 20),
            
            // Add intermediate stops
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: stopController,
                    decoration: const InputDecoration(labelText: 'Add Intermediate Stop'),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add, color: Colors.green),
                  onPressed: addStop,
                ),
              ],
            ),
            const SizedBox(height: 10),
            
            // Display added stops
            if (stops.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Intermediate Stops:", style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: stops.length,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(stops[index]),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => removeStop(index),
                      ),
                    ),
                  ),
                ],
              ),
            const SizedBox(height: 20),
            
            // Save button
            ElevatedButton(
              onPressed: saveRoute,
              style: ElevatedButton.styleFrom(
                iconColor: Colors.blueAccent, // Custom color for the button
                padding: const EdgeInsets.symmetric(vertical: 14),
                textStyle: const TextStyle(fontSize: 16),
              ),
              child: const Text('Add Route'),
            ),
          ],
        ),
      ),
    );
  }
}
